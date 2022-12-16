import 'package:flutter/material.dart';


const String pathProduction = "http://alertahunter.herokuapp.com/API";

enum InputTypeEnum{
  text,
  telefono,
}

Map<InputTypeEnum, TextInputType> inputTypeMap = {
  InputTypeEnum.text : TextInputType.text,
  InputTypeEnum.telefono : TextInputType.number,
};