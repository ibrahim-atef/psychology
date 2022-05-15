import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_main_controller.dart';
import 'package:psychology/utils/constants.dart';
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
                                imageUrl:
                                    mainDoctorController.myData.value!.profileUrl!,
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
                                        mainDoctorController.myData.value!.displayName
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
            )
          ],
        ),
      ),
    );
  }
}
