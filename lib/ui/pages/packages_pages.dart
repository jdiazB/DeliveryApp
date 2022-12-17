import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/model/user_register_map.dart';
import 'package:proyecto_final/providers/order_provider.dart';
import 'package:proyecto_final/providers/register_provider.dart';
import 'package:proyecto_final/service/my_service_firestore.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/map_user_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_textfield_search.dart';
import 'package:proyecto_final/utils/mediaquery.dart';
import 'dart:io';

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

  String categorytype = 'Comida';
  List category = ['Documentos', 'Ropa', 'Celular', 'Comida'];

  MyServiceFirestore orderService = MyServiceFirestore(collection: "orders");
  String keyorder="";
  // @override
  // initState(){
  // super.initState();
  // keyorder=_spGlobal.documentid;
  // print(keyorder+"initstate");
  // setState(() {
  //
  // });
  // }

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
                          keyorder=_spGlobal.documentid;
                          QuantityProvider registerProvider =
                          Provider.of<QuantityProvider>(context, listen: false);
                          UserRegisterMap model = UserRegisterMap(
                            email: _spGlobal.email,
                            fullName: _spGlobal.fullName,
                            phone: _spGlobal.phone,
                            id: keyorder,
                            pickup: _controllerpickup.text,
                            delivery: _controllerDelivery.text,
                            category: categorytype!,
                            typecategory: typePackage,
                            quantity: registerProvider.quantity.toString(),
                            data: DateTime.now().toString().substring(0,16) ,
                            price: registerProvider.price ,
                            status: "Enviado",
                          );
                          print(model.toJson());
                          if (model != null) {
                            orderService.addOrdens(model);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InitPage(),
                                ),
                                (route) => false);
                            showSnackBarSuccess(context, "La orden fue enviada");
                            print(model);
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
    QuantityProvider registerProvider =
        Provider.of<QuantityProvider>(context, listen: false);

    registerProvider.quantity = 1;

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
                            registerProvider.price = 5;
                            registerProvider.tempPrice = 5;
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
                            registerProvider.tempPrice = 7;
                            registerProvider.price = 7;
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
                      GestureDetector(
                        onTap: () {
                          categorytype = category[0];
                          print(categorytype);
                          setState(() {});
                        },
                        child: Chip(
                          label: Text(
                            "Documentos",
                            style: TextStyle(
                                color: categorytype == 'Documentos'
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          categorytype = category[1];
                          print(categorytype);
                          setState(() {});
                        },
                        child: Chip(
                          label: Text(
                            "Ropa",
                            style: TextStyle(
                                color: categorytype == 'Ropa'
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          categorytype = category[2];
                          print(categorytype);
                          setState(() {});
                        },
                        child: Chip(
                          label: Text(
                            "Celular",
                            style: TextStyle(
                                color: categorytype == 'Celular'
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          categorytype = category[3];
                          print(categorytype);
                          setState(() {});
                        },
                        child: Chip(
                          label: Text(
                            "Comida",
                            style: TextStyle(
                                color: categorytype == 'Comida'
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  spacing30,

                  Consumer<QuantityProvider>(
                    builder: (context, provider, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: kFontItem,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: provider.quantity > 1
                                      ? () {
                                          provider.removeQuantity();
                                        }
                                      : null,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: provider.quantity > 1
                                            ? Colors.black87
                                            : Colors.black12),
                                    child: Icon(Icons.remove,
                                        size: 16,
                                        color: provider.quantity > 1
                                            ? Colors.white
                                            : Colors.black87),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: H5(
                                    text: provider.quantity.toString(),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.addQuantity();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black87),
                                    child: Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          H2(
                            text: "S/ ${provider.price.toStringAsFixed(2)}",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          )
                        ],
                      );
                    },
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Precio Total :",
                  //         style: TextStyle(
                  //             fontSize: 20, fontWeight: FontWeight.w400),
                  //       ),
                  //       Text(
                  //         "S/ 46.00",
                  //         style: TextStyle(
                  //             fontSize: 20, fontWeight: FontWeight.bold),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  spacing20,
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
