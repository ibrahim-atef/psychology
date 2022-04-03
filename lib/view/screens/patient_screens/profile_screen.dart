import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';
import 'package:psychology/controller/controllers/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/home_widgets/user_image_and_name.dart';

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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserImageAndName(),
              ],
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
              onPressed: () {},
              icon: Icons.edit,
              iconColor: Colors.white,
              label: '  Edit Profile',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 20),
            buildTextButtonIcon(
              onPressed: () {},
              icon: Icons.messenger_outline_outlined,
              iconColor: Colors.white,
              label: '  Invite a friend',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 20),
            buildTextButtonIcon(
              onPressed: () {},
              icon: Icons.help,
              iconColor: Colors.white,
              label: '  Help',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
           const Spacer(flex: 1),
            GetBuilder<AuthController>(
              builder: (_) {
                return TextButton.icon(
                  onPressed: () {
                    controller.signOutFromApp();
                  },
                  icon: Icon(Icons.logout,color: Colors.red,size: 30,),
                  label: Text("LogOut",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
                );
              },
            ),
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
    TextStyle? style,
  }) {
    return Container(
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
                borderRadius: BorderRadius.circular(10), color: mainColor),
            child: Icon(
              icon,
              color: iconColor,
            )),
        label: Text(label, style: style),
      ),
    );
  }
}
