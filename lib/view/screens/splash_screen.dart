import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0, 1.2),
              colors: [
            Color(0xff5599ff),
            Color(0xff5e2ef4),
            //updated
          ])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Image.asset(
                  "assets/images/appicon.png",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Psychology",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white,decoration: TextDecoration.none),
            ),

          ],
        ),
      ),
    );
  }
}
