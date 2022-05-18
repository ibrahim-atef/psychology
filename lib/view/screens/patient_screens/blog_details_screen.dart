import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/controller/controllers/patient_controller/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/utils/styles.dart';

class BlogDetailScreen extends StatelessWidget {
  final GetStorage authBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height * .27,
                child: Stack(
                  children: [
                    ClipRRect(
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
                    Positioned(
                        left: -8,
                        top: 5,
                        child: RawMaterialButton(
                          padding: EdgeInsets.all(8),
                          onPressed: () {
                            Get.back();
                          },
                          child: Icon(
                            IconBroken.Arrow___Left_2,
                            color: Colors.black,
                          ),
                          elevation: 4,
                          shape: const CircleBorder(),
                          fillColor: Colors.white54,
                        )),
                  ],
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
      floatingActionButton: authBox.read(KUid) == Get.arguments[3]
          ? GetX(
              init: PatientHomeScreenController(),
              builder:
                  (PatientHomeScreenController patientHomeScreenController) {
                return  FloatingActionButton(
                        backgroundColor: homeBackGroundColor,
                        onPressed: () async {
                          patientHomeScreenController.daleteBlog(
                              id: Get.arguments[4]);
                        },
                        child: patientHomeScreenController.isDeleting.value
                            ? const Center(
                          child: CircularProgressIndicator(color: mainColor2,),
                        )
                            : Icon(
                          IconBroken.Delete,
                          color: mainColor2,
                        ),
                      );
              },
            )
          : SizedBox(),
    );
  }
}
