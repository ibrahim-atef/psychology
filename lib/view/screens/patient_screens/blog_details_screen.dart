import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:psychology/utils/constants.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(

              children: [
                 SizedBox(
                  width: Get.width,
                  height: Get.height * .27,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    child: FadeInImage.assetNetwork(
                      height: Get.height * .25,
                      width: Get.width,
                      placeholder: "assets/animations/loading.gif",
                      image: Get.arguments[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    Get.arguments[1],
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: black,
                        fontFamily: "Cairo",
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    Get.arguments[2],
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontFamily: "Cairo",
                        color: black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
