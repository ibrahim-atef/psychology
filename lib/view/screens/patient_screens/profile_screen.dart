import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';
import 'package:psychology/controller/controllers/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/height_size_box.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

import '../../widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

class PatientProfileScreen extends StatelessWidget {
  PatientProfileScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  final cc = Get.put(PatientHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(
              flex: 2,
            ),
            GetBuilder<PatientHomeScreenController>(
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CirculeImageAvatar(
                      imageUrl: cc.imageUrl,
                      width: SizeConfig.defaultSize! * 4,
                    ),
                    HeightSizeBox(SizeConfig.defaultSize! * .7),
                    KTextUtils(
                        text: "${cc.name}",
                        size: 22,
                        color: darkGrey,
                        fontWeight: FontWeight.w700,
                        textDecoration: TextDecoration.none),
                    HeightSizeBox(SizeConfig.defaultSize! * .2),
                    KTextUtils(
                        text: "${cc.email}",
                        size: 15,
                        color: grey,
                        fontWeight: FontWeight.w400,
                        textDecoration: TextDecoration.none)
                  ],
                );
              },
            ),
            const Divider(
              thickness: 1,
              indent: 50,
              endIndent: 50,
            ),
            const Spacer(
              flex: 2,
            ),
            buildTextButtonIcon(
              backColor: mainColor,
              onPressed: () {},
              icon: Icons.edit,
              iconColor: Colors.white,
              label: '  Edit Profile    ',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 20),
            buildTextButtonIcon(
              backColor: mainColor,
              onPressed: () {
                print(GetStorage().read(KUid).toString());
              },
              icon: Icons.messenger_outline_outlined,
              iconColor: Colors.white,
              label: '  Invite a friend   ',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 20),
            buildTextButtonIcon(
              backColor: mainColor,
              onPressed: () {},
              icon: Icons.help,
              iconColor: Colors.white,
              label: '  Help    ',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const Spacer(flex: 1),
            GetBuilder<AuthController>(
              builder: (_) {
                return buildTextButtonIcon(
                    onPressed: () {
                      controller.signOutFromApp();
                    },
                    label: "LogOut",
                    icon: Icons.logout,
                    iconColor: Colors.red,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    backColor: Colors.transparent);
              },
            ),
            // GetBuilder<AuthController>(
            //   builder: (_) {
            //     return TextButton.icon(
            //       onPressed: () {
            //         controller.signOutFromApp();
            //       },
            //       icon: Icon(
            //         Icons.logout,
            //         color: Colors.red,
            //         size: 30,
            //       ),
            //       label: Text(
            //         "LogOut",
            //         style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black54),
            //       ),
            //     );
            //   },
            // ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );

    //   Center(
    //     child: Column
    //       (mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         SizedBox(height: 200,),
    //         Center(
    //           child: GetBuilder<AuthController>(
    //             builder: (_) {
    //               return InkWell(
    //                   onTap: () {
    //                     controller.signOutFromApp();
    //                   },
    //                   child: Text("LogOut"));
    //             },
    //           ),
    //         ),
    //         Center(
    //           child: GetBuilder<PatientHomeScreenController>(
    //             builder: (_) {
    //               return InkWell(
    //                   onTap: () {
    //                      //cc.getDooctorsInfo();
    //                   },
    //                   child: Text("DoctorData"));
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  buildTextButtonIcon({
    required Function()? onPressed,
    required String label,
    required IconData icon,
    Color? iconColor,
    Color? backColor,
    TextStyle? style,
  }) {
    return InkWell(
     onTap: onPressed,
      child: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
        child: TextButton.icon(
          onPressed: onPressed,
          icon: Container(
              width: SizeConfig.defaultSize! * 2.2,
              height: SizeConfig.defaultSize! * 2.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: backColor),
              child: Icon(
                icon,
                color: iconColor,
              )),
          label: Text(label, style: style),
        ),
      ),
    );
  }
}
