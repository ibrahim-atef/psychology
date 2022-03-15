import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';
import 'package:psychology/utils/size_config.dart';

import '../../../utils/constants.dart';

class ProfileImagePicking extends StatelessWidget {
  ProfileImagePicking({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: width * .25,
                      width: width * .25,
                      child: controller.profileImage == null
                          ? Image.asset("assets/images/profile.png")
                          : Image.file(
                              controller.profileImage!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 9,
                    right: 9,
                    child: IconButton(
                      onPressed: () {
                        controller.getImage();
                      },
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: white,
                      ),
                    ))
              ],
            ),
          ],
        );
      },
    );
  }
}
