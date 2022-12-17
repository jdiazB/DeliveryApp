import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_shipping.dart';
import 'package:proyecto_final/utils/assets_data.dart';
import 'package:proyecto_final/utils/mediaquery.dart';
import 'package:proyecto_final/utils/searchdelegate.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SPGlobal _spGlobal = SPGlobal();
  String fullName="";
  String urlImage="";
  final TextEditingController _searchController = TextEditingController();

  @override
  initState(){
  super.initState();
  getShared();
  }

  getShared() async {
    fullName= _spGlobal.fullName;
    urlImage =_spGlobal.image;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
        body: SafeArea(
          child: Stack(
           children: [
           Column(
            children: [
              Container(
                height: ResponsiveUI(context).hp(13),
                width: double.infinity,
                color: kBrandPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: urlImage.isEmpty ?  NetworkImage(
                            "https://media-exp1.licdn.com/dms/image/C4E03AQH2NGuN_qeByg/profile-displayphoto-shrink_800_800/0/1661435123282?e=2147483647&v=beta&t=DASKRXSuSVahAZizUbiUQKLUAIcIIDrFjTwPcICZNzQ"): NetworkImage(urlImage),
                      )  ,
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bienvenido!",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              fullName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          H5(text: "Lima, Peru", color: Colors.black45,),
                          spacingWidth6,
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff6383E5)
                            ),
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: ResponsiveUI(context).hp(13),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: ResponsiveUI(context).hp(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kBrandSecundaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spacing20,
                        Text("Rastrea tu paquete",style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold
                        ),),
                        spacing6,
                        Text("Ingresa el numero de tu paquete",style: TextStyle(
                          fontSize: 15,color: Colors.black.withOpacity(0.5)
                        ),),
                        spacing20,
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextField(
                            controller: _searchController,
                            onTap: () async{
                             await  showSearch(context: context, delegate: searchdelegate());
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                                hintText: "Ingresa el numero del paquete",
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.5)
                              ),
                              filled: true,
                              fillColor: Colors.black12,
                              prefixIcon: Icon(Icons.search_outlined,size: 20,color:Colors.black12 ,),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none
                              ),


                            ),
                          ),
                        ),
                        SizedBox(height: 50,)


                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),

          Column(
            children: [
              SizedBox(
                height: ResponsiveUI(context).hp(38),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacing6,
                          Text("Nuestros Servicios",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          spacing20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(20)

                                    ),
                                  child: SvgPicture.asset(AssetData.iconPackage),width: 80,height: 80,),
                                  spacing6,
                                  Text("Paquetes",style: TextStyle(
                                    fontSize: 16,fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(20)

                                    ),
                                    child: SvgPicture.asset(AssetData.iconProduct),width: 80,height: 80,),
                                  spacing6,
                                  Text("Productos",style: TextStyle(
                                      fontSize: 16,fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(20)

                                    ),
                                    child: SvgPicture.asset(AssetData.iconFile),width: 80,height: 80,),
                                  spacing6,
                                  Text("Documentos",style: TextStyle(
                                      fontSize: 16,fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                            ],
                          ),
                          spacing20,
                          Text("Envios recientes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          spacing20,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(children: [
                              ItemShipping(),
                              ItemShipping(),
                              ItemShipping(),
                              ItemShipping(),
                              ItemShipping(),
                              ItemShipping(),
                            ],),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],

          )
        ],
      ),
    ));
  }
}
