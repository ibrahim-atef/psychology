import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';
import 'package:psychology/controller/controllers/patient_home_screen_controller.dart';
import 'package:psychology/model/patint_info_model.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

import '../../utils_widgets/text_utils.dart';

class UserImageAndName extends StatelessWidget {
  final controller = Get.put(PatientHomeScreenController());
  final authController = Get.put(AuthController());
  GetStorage authBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: GetBuilder<PatientHomeScreenController>(
        builder: (_) {
          return StreamBuilder<DocumentSnapshot>(
            stream:
                FireStoreMethods().patients.doc(authBox.read(KUid)).snapshots(),
            builder: (context, snapshot) {
              try {
                if (snapshot.hasData) {
                  controller.patientInfoModel = null;

                  controller.patientInfoModel =
                      PatientInfoModel.fromMap(snapshot.data!);

                  return controller.patientInfoModel != null
                      ? Row(
                          children: [
                            CirculeImageAvatar(
                              imageUrl: controller.patientInfoModel!.profileUrl
                                  .toString(),
                              width: SizeConfig.defaultSize! * 4,
                            ),
                            SizedBox(
                              width: SizeConfig.defaultSize,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KTextUtils(
                                    text: "Hello,",
                                    size: 18,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w500,
                                    textDecoration: TextDecoration.none),
                                KTextUtils(
                                    text: controller
                                        .patientInfoModel!.displayName
                                        .toString(),
                                    size: 22,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w600,
                                    textDecoration: TextDecoration.none),
                              ],
                            )
                          ],
                        )
                      : SizedBox(
                          child: LinearProgressIndicator(),
                        );
                } else {
                  return SizedBox(child: LinearProgressIndicator());
                }
              } catch (e) {
                return Center(
                  child: Column(
                    children: const [
                      LinearProgressIndicator(),
                      Text(
                        "Your access denied",
                        style: TextStyle(
                          color: Colors.red,
                        fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
