import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/splash_controller.dart';
import 'package:psychology/utils/themes.dart';

class MatrealBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;

  MatrealBtn(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.width})
      : super(key: key);
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GetBuilder<SplashController>(
      builder: (_) {
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            height: height * .055,
            width: width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  mainColor,
                  mainColor2,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 22,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        );
      },
    );
  }
}
