
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyecto_final/ui/pages/direction_profile_page.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_listitle.dart';
import 'package:proyecto_final/utils/assets_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

Future<void> signOutGoogle() async{
  await _googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();

}



class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(),
                  Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(4, 4),
                              blurRadius: 4)
                        ]),
                    child: Icon(Icons.edit),
                  )
                ],
              ),
              spacing20,
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://media-exp1.licdn.com/dms/image/C4E03AQH2NGuN_qeByg/profile-displayphoto-shrink_800_800/0/1661435123282?e=2147483647&v=beta&t=DASKRXSuSVahAZizUbiUQKLUAIcIIDrFjTwPcICZNzQ'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Positioned(
                        right: 1,
                        top: 65,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff48D187)),
                        ),
                      ),
                    ],
                  ),
                  spacingWidth14,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jorge Diaz",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      spacing10,
                      Text(
                        "jorgeleoneldb@gmail.com",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              spacing20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "89",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      spacing6,
                      Text("Envios")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "29856",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      spacing6,
                      Text("Transacciones")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "S/ 89.0",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      spacing6,
                      Text("Gasto")
                    ],
                  ),
                ],
              ),
              spacing20,
              ItemListitle(
                title: 'Configuracion de pago',
                image: AssetData.imageCard,
                icons: Icons.arrow_forward_ios_rounded,
                onTap: () {},
              ),
              ItemListitle(
                  title: 'Direcciones',
                  image: AssetData.imageLocation,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DirectionProfilePage(),
                        ));
                  }),
              ItemListitle(
                  title: 'Configuracion',
                  image: AssetData.imageGear,
                  icons: Icons.arrow_forward_ios_rounded,
                  onTap: () {}),
              ItemListitle(
                  title: 'Salir',
                  image: AssetData.imageExit,
                  onTap: ()  {
                   signOutGoogle();


                    // Navigator.pop(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DirectionProfilePage(),));
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
