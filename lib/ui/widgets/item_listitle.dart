import 'package:flutter/material.dart';
import 'package:proyecto_final/utils/assets_data.dart';

import '../general/colors.dart';

class ItemListitle extends StatelessWidget {
  String title;
  String image;
  IconData? icons;
  Function onTap;


  ItemListitle({
    required this.title,
    required this.image,
    this.icons,
    required this.onTap


});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(4, 2,),
            blurRadius: 2
          )
        ]
      ),
      child: ListTile(
        onTap: () {
          onTap();
        },
        contentPadding: EdgeInsets.all(5),
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: kFontItem,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Image.asset(image,fit: BoxFit.cover,),
        ),
        title: Text(title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.black54)),
        trailing: Icon(icons,size: 35,),

      ),
    );
  }
}
