
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';

Color kBrandPrimaryColor = const Color(0xff4D72E0);
Color kBrandSecundaryColor = const Color(0xffF8EDC3);
Color kFontItem = Colors.lightBlue.withOpacity(0.05);
Color kFontButton = const Color(0xffF89132);
Color klabel = const Color(0xfff7fff7);
Map<String, Color> StatusColor = {
  "Enviado": Color(0xff38b000),
  "En proceso": Color(0xffffb703),
  "Entregado": Color(0xff293241),
};


showSnackBarSuccess(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      backgroundColor: const Color(0xff17c3b2),
      content: Row(
        children: [
          const Icon(Icons.check, color: Colors.white,),
          spacingWidth10,
          Text(text)
        ],
      ),
    ),
  );
}

showSnackBarError(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      backgroundColor: Colors.redAccent,
      content: Row(
        children: [
          const Icon(Icons.warning_amber, color: Colors.white,),
          spacingWidth10,
          Text(text)
        ],
      ),
    ),
  );
}
