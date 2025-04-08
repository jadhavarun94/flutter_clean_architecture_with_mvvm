import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.fromHexToColor("#ED9728");
  static Color darkGrey = HexColor.fromHexToColor("#525252");
  static Color grey = HexColor.fromHexToColor("#737477");
  static Color light = HexColor.fromHexToColor("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHexToColor("#ED9728");


  //New colors
  static Color darkPrimary = HexColor.fromHexToColor("#d17d11");
  static Color grey1 = HexColor.fromHexToColor("#525252");
  static Color grey2 = HexColor.fromHexToColor("#707070");
  static Color white = HexColor.fromHexToColor("#FFFFFF");
  static Color error = HexColor.fromHexToColor("#e61f34"); //red color

}


extension HexColor on Color{
  static Color fromHexToColor(String hexColorString){
    hexColorString = hexColorString.replaceAll( '#', '');
    if(hexColorString.length == 6){
hexColorString = "FF$hexColorString"; // 8 char with 100% opacity
    }
    return Color(int.parse(hexColorString,radix: 16));
  }
}