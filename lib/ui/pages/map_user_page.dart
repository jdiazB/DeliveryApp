import 'dart:convert';

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
import 'package:proyecto_final/utils/map_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapUserPage extends StatefulWidget {
  @override
  State<MapUserPage> createState() => _MapUserPageState();
}

class _MapUserPageState extends State<MapUserPage> {
  final SPGlobal _spGlobal = SPGlobal();
  String directionpickup = "";
  String directiondelivery = "";
  String delivery = "";
  Set<Marker> markes = {};
  String pickup = "";
  late GoogleMapController googleMapController;
  LatLng? position;

  save2() {
    _spGlobal.pickup = directionpickup;
    _spGlobal.delivery=directiondelivery;
    // street=street;
    setState(() {});
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

  Future<void> moveCamera(LatLng position) async{
    CameraUpdate cameraUpdate = await CameraUpdate.newLatLng(position);
    googleMapController.animateCamera(cameraUpdate);
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
                  zoomControlsEnabled: true,
                  mapToolbarEnabled: false,
                  zoomGesturesEnabled: true,
                  initialCameraPosition: cameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                    googleMapController.setMapStyle(jsonEncode(mapstyle));
                  },
                  markers: markes,
                  onTap: (LatLng position) {
                    Marker myMarker = Marker(
                      markerId: MarkerId('1'),
                      position: position,
                      draggable: true,
                      onDrag: (LatLng newPosition) {
                        newPosition = position;
                        print(newPosition);
                      },
                    );
                    markes.add(myMarker);

                    getUserLocation(position).then((value) {
                      delivery = "${value.street}";
                      directiondelivery =
                          "${value.street}, ${value.locality}, ${value.country}";
                      // print(direction);
                      // street = "${value.street}";

                      save2();
                      // print(direction);
                      // print(direction);
                    });

                    setState(() {});
                  },
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Card(
                          color: Colors.grey[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: pickup.isNotEmpty
                                ? Text(
                                    "Desde : ${pickup}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    "Direccion de recojo",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Card(
                          color: Colors.grey[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: delivery.isNotEmpty
                                ? Text(
                              "Hasta : ${delivery}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                : Text(
                              "Direccion de entrega",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            position = LatLng(cameraPosition.target.latitude,
                                cameraPosition.target.longitude);
                             Marker mymarker2 = Marker(
                                markerId: MarkerId("value"),
                                position: position!,
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueBlue),
                                draggable: true,
                                onDrag: (LatLng newPosition) {
                                   newPosition = position!;
                                },
                              );
                             markes.add(mymarker2);

                            moveCamera(position!);
                            getUserLocation(position!).then((value) {
                              pickup = "${value.street}";
                              directionpickup =
                                  "${value.street}, ${value.locality}, ${value.country}";
                              // print(direction);
                              // print(direction);

                              save2();
                              // print(direction);
                              // print(direction);
                            });
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 40),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kFontButton),
                            child: Icon(
                              Icons.location_searching,
                              color: Colors.black45,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                    ItemElevatedButtom(
                      height: 6,
                      whidt: 60,
                      color: kBrandPrimaryColor,
                      text: "Confirmar direcciones",
                      onTap: () {
                        if (directionpickup !=null && directiondelivery != null) {
                          Navigator.pop(
                            context,
                          );
                        }
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
