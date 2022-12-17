import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/model/user_register_map.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_statusdelivery.dart';
import 'package:proyecto_final/utils/assets_data.dart';

class ItemShipping extends StatelessWidget {
  UserRegisterMap userRegisterMap;
  ItemShipping({
    required this.userRegisterMap
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15,),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: SvgPicture.asset(AssetData.iconPackage,color: kBrandPrimaryColor,),
              ),
              spacingWidth6,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("One Package",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("Amazon inc",style: TextStyle(color: Colors.black.withOpacity(0.5)),)
                ],
              ),
              SizedBox(width: 30,),
             // ItemStatusDelivery(),
            ],
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("10 mar, 2022",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),),
                  spacing3,
                  Text("Estimacion de envio")
                ],
              ),
              SizedBox(width: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("#09545646464",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),),
                  spacing3,
                  Text("Numero de registro"),
                ],

              ),


            ],
          ),spacing20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(radius: 25, backgroundImage: NetworkImage("https://laopinion.com/wp-content/uploads/sites/3/2021/06/delivery-repartidor-shutterstock_1694937289.jpg?quality=60&strip=all&w=1200")),
              spacingWidth6,
              Column(
                children: [
                  Text("Robert Fox",style: TextStyle(fontSize: 18),),
                  Text("FeDex delivery"),
                ],
              ),
              SizedBox(width: 90,),
              // Icon(Icons.arrow_forward,color: Colors.black),
            ],
          )
          // ListTile(
          //   contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
          //   leading: CircleAvatar(radius: 25, backgroundImage: NetworkImage("https://laopinion.com/wp-content/uploads/sites/3/2021/06/delivery-repartidor-shutterstock_1694937289.jpg?quality=60&strip=all&w=1200")),
          //   title: Text("Robert Fox",style: TextStyle(fontSize: 18),),
          //   subtitle: Text("FeDex delivery"),
          //   trailing: Icon(Icons.arrow_forward,color: Colors.black),
          //   // leading: Icon(Icons.add),
          // ),

        ],
      ),
    );
  }
}
