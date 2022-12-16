import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/model/user_model.dart';
import 'package:proyecto_final/model/user_register_map.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/map_user_page.dart';
import 'package:proyecto_final/ui/pages/permision_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_textfield_search.dart';
import 'package:proyecto_final/utils/mediaquery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

import '../general/colors.dart';

class PackagesPage extends StatefulWidget {
  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  final SPGlobal _spGlobal = SPGlobal();
  bool isSelected = true;
  String typePackage = "caja pequeña";
  TextEditingController _controllerpickup = TextEditingController();
  TextEditingController _controllerDelivery = TextEditingController();

  getDataShared() {
    // SharedPreferences _prefs = await SharedPreferences.getInstance();
    // _controllerpickup.text =_prefs.getString("pickup") ??"";
    _controllerpickup.text = _spGlobal.pickup;
    _controllerDelivery.text = _spGlobal.delivery;
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          contentPadding: EdgeInsets.all(4),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Lottie.asset('assets/json/deliverydrone.json',
                    fit: BoxFit.fill),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text("Cancelar")),
                  ),
                  spacingWidth10,
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          bool value = true;
                          if (value = false) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InitPage(),
                                ),
                                (route) => false);


                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text("Confirmar")),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: ResponsiveUI(context).hp(20),
                decoration: BoxDecoration(
                    color: kBrandPrimaryColor,
                    gradient: LinearGradient(colors: [
                      kBrandPrimaryColor.withOpacity(0.5),
                      kBrandPrimaryColor.withOpacity(0.8)
                    ])),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Nueva Orden",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      spacing30,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            ItemTextfieldSearch(
                                icon: Icon(Icons.location_on_outlined),
                                hintText: "Lugar de recogida",
                                color: Colors.black45,
                                controller: _controllerpickup,
                                onTap: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MapUserPage(),
                                      ));
                                  getDataShared();
                                }),
                            Divider(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            ItemTextfieldSearch(
                              icon: Icon(Icons.location_on_outlined),
                              hintText: "Lugar de Destino",
                              color: Colors.black45,
                              controller: _controllerDelivery,
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapUserPage(),
                                    ));
                                getDataShared();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selecciona el tamaño",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.black.withOpacity(0.3),
                      )
                    ],
                  ),
                  spacing14,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            isSelected = true;
                            typePackage = "caja pequeña";
                            // print("caja pequeña");
                            setState(() {});
                          },
                          // onDoubleTap: () {
                          //   isSelected = false;
                          //   print(isSelected);
                          //   setState(() {
                          //
                          //   });
                          //
                          // },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.red.withOpacity(0.8)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: kFontItem,
                                      borderRadius: BorderRadius.circular(15)
                                      // image: DecorationImage(image: AssetImage('assets/images/caja1.png'),fit: BoxFit.cover)
                                      ),
                                  child: Image.asset(
                                    'assets/images/caja1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                spacingWidth3,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pequeño",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    spacing3,
                                    Text("1kg - 5kg"),
                                  ],
                                ),
                                spacingWidth14
                              ],
                            ),
                          ),
                        ),
                        spacingWidth10,
                        InkWell(
                          onTap: () {
                            isSelected = false;
                            // print("caja grande");
                            typePackage = "caja grande";
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: !isSelected
                                    ? Colors.blue.withOpacity(0.8)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: kFontItem,
                                      borderRadius: BorderRadius.circular(15)
                                      // image: DecorationImage(image: AssetImage('assets/images/caja1.png'),fit: BoxFit.cover)
                                      ),
                                  child: Image.asset(
                                    'assets/images/caja2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                spacingWidth10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Grande",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    spacing3,
                                    Text("5kg *  "),
                                  ],
                                ),
                                spacingWidth14,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spacing30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tipo de paquete",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.black.withOpacity(0.3),
                      )
                    ],
                  ),
                  spacing20,
                  Wrap(
                    runSpacing: 2,
                    spacing: 10,
                    children: [
                      Chip(
                        label: Text("Documentos"),
                      ),
                      Chip(label: Text("Ropa")),
                      Chip(label: Text("Electricos")),
                      Chip(label: Text("Celular")),
                      Chip(label: Text("Laptop")),
                      Chip(label: Text("Comida")),
                    ],
                  ),
                  spacing30,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Precio Total :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "S/ 46.00",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  spacing10,
                  Center(
                    child: SizedBox(
                        height: ResponsiveUI(context).hp(6),
                        width: ResponsiveUI(context).wp(80),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_controllerDelivery != null &&
                                  _controllerpickup != null &&
                                  _controllerpickup.text.isNotEmpty &&
                                  _controllerDelivery.text.isNotEmpty) {
                                showAlert(context);
                                print(typePackage);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffF89132),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            child: Text("Realizar envio"))),
                  ),
                  spacing10,
                  // ListView(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   children: [
                  //     Text("Historial de envios"),
                  //     Text("Envio realizado"),
                  //     Text("Envio realizado"),
                  //     Text("Envio realizado"),
                  //     Text("Envio realizado"),
                  //     Text("Envio realizado"),
                  //     Text("Envio realizado"),
                  //
                  //
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
