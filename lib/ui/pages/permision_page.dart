import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/map_user_page.dart';
import 'package:proyecto_final/ui/pages/packages_pages.dart';

class PermisionPage extends StatelessWidget {
  const PermisionPage({Key? key}) : super(key: key);

  checkPermission(PermissionStatus status, BuildContext context){
    switch(status){
      case PermissionStatus.granted:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> InitPage()),);
        break;
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.limited:
      case PermissionStatus.denied:
        openAppSettings();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/location.svg',
                height: 140.0,
              ),
              const SizedBox(
                height: 12.0,
              ),
              H3(text: "Permitir ubicación",fontWeight: FontWeight.w700,

                // style: TextStyle(
                //   fontSize: 18.0,
                //   color: Color(0xff202644),
                // ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              H4(text: "Activa el GPS para acceder a tu ubicacion", color: Color(0xff202644).withOpacity(0.70),
                // textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 14.0,
                //   color: Color(0xff202644).withOpacity(0.70),
                // ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () async{

                  PermissionStatus status = await Permission.location.request();
                  checkPermission(status, context);

                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    primary: Color(0xff202644)
                ),
                child: Text(
                  "Activar GPS",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
