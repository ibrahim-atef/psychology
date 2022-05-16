import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_main_controller.dart';
 import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/styles.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

import '../../widgets/utils_widgets/text_utils.dart';

class DoctorHomeScreen extends StatelessWidget {
  //final mainDoctorController = Get.find<>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .05,
            ),
            GetBuilder(
              builder: (MainDoctorController mainDoctorController) {
                return mainDoctorController.myData.value == null
                    ? LinearProgressIndicator(
                        color: mainColor2,
                        minHeight: 2,
                      )
                    : SizedBox(
                        height: Get.height * .11,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CirculeImageAvatar(
                                imageUrl: mainDoctorController
                                    .myData.value!.profileUrl!,
                                width: Get.width * .233),
                            SizedBox(
                              width: Get.height * .01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                KTextUtils(
                                    text: "Hello,",
                                    size: 18,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w500,
                                    textDecoration: TextDecoration.none),
                                KTextUtils(
                                    text: "Dr " +
                                        mainDoctorController
                                            .myData.value!.displayName
                                            .toString(),
                                    size: 22,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w600,
                                    textDecoration: TextDecoration.none),
                              ],
                            )
                          ],
                        ));
              },
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            GetBuilder(
              builder: (MainDoctorController mainDoctorController) {
                return Container(
                  height: Get.height * .05,
                  width: Get.width * .9,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: mainColor2, width: 1.3)),
                  child: GestureDetector(
                    onTap: () {
                      print("fffffffff");
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  IconBroken.Edit,
                                  color: mainColor4,
                                  size: 20,
                                ),
                                Text(
                                  "Write New Blog",
                                  style: TextStyle(
                                      fontFamily: "cairo", color: mainColor4),
                                )
                              ],
                            ),
                            Icon(
                              IconBroken.Image,
                              color: mainColor4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
