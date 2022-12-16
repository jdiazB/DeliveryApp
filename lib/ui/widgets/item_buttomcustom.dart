import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/utils/mediaquery.dart';

class ButtonCustomWidget extends StatelessWidget {
  String text;
  Color color;
  String icon;
  Function onPressed;

  ButtonCustomWidget({
    required this.text,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveUI(context).hp(6),
      width: ResponsiveUI(context).wp(80)  ,
      child: ElevatedButton.icon(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        icon: SvgPicture.asset(
          'assets/icons/$icon.svg',
          color: Colors.white,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}