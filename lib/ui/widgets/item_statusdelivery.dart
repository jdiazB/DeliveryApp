import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/general/colors.dart';

class ItemStatusDelivery extends StatelessWidget {
  String text;
  ItemStatusDelivery({
    required this.text
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: StatusColor[text],
          borderRadius: BorderRadius.circular(30)
      ),
      child: Text(text),
    );
  }
}
