import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_elevatebuttom.dart';
import 'package:proyecto_final/ui/widgets/item_listitle.dart';
import 'package:proyecto_final/ui/widgets/item_statusdelivery.dart';
import 'package:proyecto_final/utils/mediaquery.dart';

class TrackModalPages extends StatefulWidget {
  const TrackModalPages({Key? key}) : super(key: key);

  @override
  State<TrackModalPages> createState() => _TrackModalPagesState();
}

class _TrackModalPagesState extends State<TrackModalPages> {
  
  
  // showAlertDialog(BuildContext context){
  //   showDialog(context: context, builder: (BuildContext context) {
  //     return Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text("Hola")
  //       ],
  //     );
  //   },);
  // }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                spacing20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(),
                    H3(text: 'Informacion del envio',fontWeight: FontWeight.bold,),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.cancel,size: 25,)),
                  ],
                ),
                spacing10,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        H4(text: 'N° Orden :',),
                        H4(text: '85858585585585558858',),
                      ],),
                      spacing10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          H4(text: 'Fecha Recojo:'),
                          H4(text: '22/05/2022',),
                        ],),
                      spacing10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          H4(text: 'Fecha Estimada:'),
                          H4(text: '22/05/2022',),
                        ],),
                      spacing10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          H4(text: 'Estado:'),
                          ItemStatusDelivery(),
                        ],)
                    ],
                  ),
                ),
                spacing14,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                    color: kFontItem,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(

                        children: [
                          Image.asset('assets/images/almacen.png',width: 50,height: 50,),
                          spacingWidth6,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                H6(text: 'Direccion de recojo',color: Colors.black45,),
                                spacing6,
                                H4(text: 'Direccion de envio',fontWeight: FontWeight.bold),
                                spacing10,
                                Container(
                                  width: 280,
                                  height: 1,
                                  color: Colors.black.withOpacity(0.3),
                                )

                              ],
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Icon(Icons.more_vert),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/camion.png',width: 50,height: 50,),
                          spacingWidth6,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                H6(text: 'Direccion de envio',color: Colors.black45,),
                                spacing6,
                                H4(text: 'Direccion de envio',fontWeight: FontWeight.bold),
                                spacing10,
                                Container(
                                  width: 280,
                                  height: 1,
                                  color: Colors.black.withOpacity(0.3),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                      spacing14,
                      Row(children: [
                        Image.asset('assets/images/caja1.png',width: 40,height: 40,),
                        spacingWidth14,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              H6(text: 'Tipo de paquete',color: Colors.black45,),
                              spacing6,
                              H4(text: 'Artefactos electronicos',fontWeight: FontWeight.bold),
                              spacing10,
                              Container(
                                width: 280,
                                height: 1,
                                color: Colors.black.withOpacity(0.3),
                              )
                              // Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                              //   width: double.infinity,
                              //   color: Colors.white12,
                              //   child: DropdownButton(
                              //     items: [
                              //     DropdownMenuItem(child: Text('comida'),value: 1,),
                              //       DropdownMenuItem(child: Text('Digital'),value: 1,)
                              //   ], onChanged: (value) {
                              //     value=1;
                              //   },),
                              // ),

                            ],
                          ),
                        )
                      ],)
                    ],
                  ),
                ),
                spacing20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      H4(text: 'Delivery Partner'),
                      spacing6,
                      ListTile(
                        contentPadding: EdgeInsets.only(right: 8),
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQH2NGuN_qeByg/profile-displayphoto-shrink_800_800/0/1661435123282?e=2147483647&v=beta&t=DASKRXSuSVahAZizUbiUQKLUAIcIIDrFjTwPcICZNzQ')),
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          H4(text: 'Jorge Diaz',fontWeight: FontWeight.bold,),
                          spacing3,
                          H5(text: 'Fedex Delivery Partnner',color: Colors.black.withOpacity(0.5),)
                        ]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFE7F78)
                              ),
                              child: Icon(Icons.phone,color: Colors.white,),
                            ),
                            spacingWidth6,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffBAB6FC)
                              ),
                              child: Icon(Icons.messenger_outline,color: Colors.white,),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                spacing30,
                Column(
                  children: [
                   ItemElevatedButtom(height:6, whidt: 80, color:  Color(0xffF89132), text: "Confirmar entrega",onTap: (){},),
                    spacing10,
                    ItemElevatedButtom(height: 6, whidt: 80, color: Color(0xff4D72E0), text: "Cancelar envio",onTap: (){
                      // showAlertDialog(context);
                    }),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
