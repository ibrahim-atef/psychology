import 'package:flutter/material.dart';
 class SizeConfig   {
  static double? screenHeight;
  static double? screenWidth;
  static double? width;
  static double? defaultSize;
  static Orientation? orientation;



  void init(BuildContext context) {
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    screenWidth = MediaQuery
        .of(context)
        .size
        .height;  width = MediaQuery
        .of(context)
        .size
        .width;
    orientation=MediaQuery.of(context).orientation;
    defaultSize=orientation==Orientation.landscape?screenHeight! * .024:screenWidth! *.024;

  }
}