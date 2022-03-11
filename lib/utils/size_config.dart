import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SizeConfig  extends GetxController{
  static double? screenHeight;
  static double? screenWidth;
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
        .height;
    orientation=MediaQuery.of(context).orientation;
    defaultSize=orientation==Orientation.landscape?screenHeight! * .024:screenWidth! *.024;

  }
}