import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/pages/map_user_page.dart';

class ItemTextfieldSearch extends StatelessWidget {
  String hintText;
  Color? color;
  Icon icon;
  TextEditingController controller;
  Function onTap;

  ItemTextfieldSearch({
    required this.hintText,
    required this.icon,
   this.color,
    required this.controller,
    required this.onTap


});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: () {
        onTap();
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
        hintText: hintText,
        hintStyle: TextStyle(
            color: color
        ),
        filled: true,
        fillColor: Colors.white12,
        prefixIcon: icon,
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
    );
  }
}
