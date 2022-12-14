import 'package:flutter/material.dart';
import 'package:proyecto_final/utils/mediaquery.dart';

class ItemElevatedButtom extends StatelessWidget {
  double height;
  double whidt;
  Color color;
  String text;
  Function onTap;

  ItemElevatedButtom({
    required this.height,
    required this.whidt,
    required this.color,
    required this.text,
     required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: ResponsiveUI(context).hp(height),
          width: ResponsiveUI(context).wp(whidt),
          child: ElevatedButton(onPressed: (){
            onTap();
          }
              ,style:ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
          ) , child: Text(text))),
    );
  }
}
