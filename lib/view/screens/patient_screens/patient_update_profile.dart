import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/height_size_box.dart';

import '../../../utils/constants.dart';
import '../../widgets/auth/profile_image_picking.dart';

class PatientUpdateProfile extends StatelessWidget {
  const PatientUpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: homeBackGroundColor,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: homeBackGroundColor,
                ),
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        centerTitle: true,
        title: const Text(
          "Update Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
        backgroundColor: mainColor2,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),

      child: Column(children: [
        HeightSizeBox(SizeConfig.defaultSize!),
        ProfileImagePicking(),
      ],),
      ),
    );
  }
}
