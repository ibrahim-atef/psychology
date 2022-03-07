import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/splash_controller.dart';
class SplashScreen extends StatelessWidget {
    SplashScreen({Key? key}) : super(key: key);
final splashController=Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Splash Screen"),),);
  }
}
