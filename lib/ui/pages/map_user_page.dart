import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/model/user_model.dart';
import 'package:proyecto_final/model/user_register_map.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/packages_pages.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_elevatebuttom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapUserPage extends StatefulWidget {
  @override
  State<MapUserPage> createState() => _MapUserPageState();
}

class _MapUserPageState extends State<MapUserPage> {
  final SPGlobal _spGlobal = SPGlobal();
  String direction = "";
  String delivery ="";
  Set<Marker> markes = {};

  save2() {
    _spGlobal.pickup = direction;
  }

  Future<CameraPosition> getPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    return CameraPosition(
        zoom: 15, target: LatLng(position.latitude, position.longitude));
  }

//obtener la direccion del lugar street con geocoding pluyin
  Future<Placemark> getUserLocation(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    // print(place);
    return place;
  }

  @override
  Widget build(BuildContext context) {
    print(getPosition());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: FutureBuilder(
        future: getPosition(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            CameraPosition cameraPosition = snap.data;
            return Stack(
              children: [
                GoogleMap(
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                  initialCameraPosition: cameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  markers: markes,
                  onTap: (LatLng position) {
                    Marker myMarker = Marker(
                      markerId: MarkerId('1'),
                      position: position,
                    );
                    markes.add(myMarker);

                    getUserLocation(position).then((value) {
                      direction =
                          "${value.street}, ${value.locality}, ${value.country}";
                      // print(direction);
                      save2();
                      // print(direction);
                    });

                    setState(() {});
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ItemElevatedButtom(
                      height: 7,
                      whidt: 80,
                      color: kBrandPrimaryColor,
                      text: "Confirmar lugar de recojo",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    spacing20,
                  ],
                ),
              ],
            );
          }
          ;
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff407899),
            ),
          );
        },
      )),
    );
  }
}
