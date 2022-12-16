import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';

import '../../utils/constants.dart';

class TextFieldCustomWidget extends StatelessWidget {
  String label;
  String hintText;
  IconData? icon;
  TextEditingController controller;


  TextFieldCustomWidget(
      {required this.controller,
        required this.label,
        required this.hintText,
         this.icon,
       });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: klabel,
          ),
        ),
        spacing10,
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,

          style: TextStyle(
            color: klabel,
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            fillColor: Colors.black26,
            filled: true,
            counter: const SizedBox(),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.white.withOpacity(0.8),
            ),
            prefixIcon: Icon(icon,size: 20,color: Colors.white.withOpacity(0.8),),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
          ),
          validator: (String? value) {
            if (value != null && value.isEmpty) {
              return "Campo obligatorio";
            }
            return null;
          },
        ),
      ],
    );
  }
}

class TextFieldCustomPasswordWidget extends StatefulWidget {
  TextEditingController controller;
  TextFieldCustomPasswordWidget({
    required this.controller,
  });

  @override
  State<TextFieldCustomPasswordWidget> createState() =>
      _TextFieldCustomPasswordWidgetState();
}

class _TextFieldCustomPasswordWidgetState
    extends State<TextFieldCustomPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tu contraseña",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: klabel,
          ),
        ),
        spacing10,
        TextFormField(
          controller: widget.controller,
          obscureText: isInvisible,
          style: TextStyle(
            color: klabel,
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            fillColor: Colors.black26,
            filled: true,
            hintText: "Ingrese su contraseña",
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.white.withOpacity(0.8),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye_outlined,
                size: 18.0,
                color: klabel,
              ),
              onPressed: () {
                isInvisible = !isInvisible;
                setState(() {});
              },
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
          ),
          validator: (String? value) {
            if (value != null && value.isEmpty) {
              return "Campo obligatorio";
            }
            return null;
          },
        ),
      ],
    );
  }
}
class TextField2CustomWidget extends StatelessWidget {
  String label;
  String hintText;
  IconData? icon;
  TextEditingController controller;


  TextField2CustomWidget(
      {required this.controller,
        required this.label,
        required this.hintText,
        this.icon,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: klabel,
          ),
        ),
        spacing10,
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,

          style: TextStyle(
            color: klabel,
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            fillColor: Colors.black26,
            filled: true,
            counter: const SizedBox(),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.white.withOpacity(0.8),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontItem.withOpacity(0.12),
                width: 0.9,
              ),
            ),
          ),
          validator: (String? value) {
            if (value != null && value.isEmpty) {
              return "Campo obligatorio";
            }
            return null;
          },
        ),
      ],
    );
  }
}
