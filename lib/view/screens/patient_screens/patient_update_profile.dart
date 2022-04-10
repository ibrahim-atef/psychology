import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/auth/auth_button.dart';
import 'package:psychology/view/widgets/auth/auth_text_from_field.dart';
import 'package:psychology/view/widgets/utils_widgets/height_size_box.dart';

import '../../../controller/controllers/auth_controller.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/profile_image_picking.dart';

class PatientUpdateProfile extends StatelessWidget {
  PatientUpdateProfile({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackGroundColor,
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
        elevation: 0,
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              mainColor2,
              mainColor4,
              mainColor,
              Color(0xffB4ECE3),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeightSizeBox(SizeConfig.defaultSize!),
                ProfileImagePicking(),
                HeightSizeBox(SizeConfig.defaultSize!),
                AuthTextFromField(
                  controller: nameController,
                  obscureText: false,
                  validator: (value) {},
                  hintText: "Full name",
                  textInputType: TextInputType.name,
                  suffixIcon: Text(""),
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: white,
                  ),
                ),
                HeightSizeBox(SizeConfig.defaultSize!),
                AuthTextFromField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {},
                  hintText: "Phone number",
                  textInputType: TextInputType.phone,
                  suffixIcon: Text(""),
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: white,
                  ),
                ),
                HeightSizeBox(SizeConfig.defaultSize!),
                AuthTextFromField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if (value.length == 0) {
                      return 'Please enter email';
                    } else if (!RegExp(validationEmail).hasMatch(value)) {
                      return "Invalid Email";
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: white,
                  ),
                  suffixIcon: Text(""),
                ),
                HeightSizeBox(SizeConfig.defaultSize!),
                GetBuilder<AuthController>(
                  builder: (_) {
                    return AuthTextFromField(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: white,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.visibility();
                        },
                        icon: controller.isVisibilty
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        color: mainColor3,
                      ),
                      controller: passwordController,
                      obscureText: controller.isVisibilty ? false : true,
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return "Password is too short";
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Password',
                      textInputType: TextInputType.visiblePassword,
                    );
                  },
                ),
                HeightSizeBox(SizeConfig.defaultSize! * 2),
                AuthButton(
                    onPressed: () {},
                    text: Text("Update",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    width: SizeConfig.width! * .7)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
