import 'package:flutter/material.dart';

class ItemStatusDelivery extends StatelessWidget {
  const ItemStatusDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: Color(0xff3EB18F),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Text("Enviado"),
    );
  }
}
