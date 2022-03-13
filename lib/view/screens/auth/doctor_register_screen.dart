import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psychology/view/widgets/auth/auth_button.dart';
import 'package:psychology/view/widgets/auth/auth_text_from_field.dart';
import 'package:psychology/view/widgets/auth/upload_file_doctor.dart';

import '../../widgets/auth/gender_widget.dart';
import '../../widgets/icon_botton_utils.dart';
import '../../widgets/text_utils.dart';

class DoctorRegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DoctorRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(      width: width,
      height: height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background.jpg",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: height * .03,
            ),
            // الايكون back
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                KIconButtom(
                    icon: Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                    function: () {
                      Get.back();
                    })
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            // الصورة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: width * .25,
                  width: width * .25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .015,
            ),
            //النص
            Padding(
              padding: const EdgeInsets.only(right: 130),
              child: KTextUtils(
                text: "Register",
                size: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none,
              ),
            ),
            Divider(
              color: Color(0xff4b455d),
              height: 10,
              endIndent: 70,
              indent: 55,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            // full name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  AuthTextFromField(
                    controller: nameController,
                    obscureText: false,
                    validator: () {},
                    hintText: 'Full Name:',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Email address
                  AuthTextFromField(
                    controller: emailController,
                    obscureText: false,
                    validator: () {},
                    hintText: 'Email address:',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Phone number
                  AuthTextFromField(
                    controller: phoneController,
                    obscureText: false,
                    validator: () {},
                    hintText: 'Phone number:',
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //password
                  AuthTextFromField(
                    controller: passwordController,
                    obscureText: false,
                    validator: () {},
                    hintText: 'Phone number:',
                    textInputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenderWidget(),
                      UploadFileDoctor(
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  AuthButton(
                      onPressed: () {}, text: "Sign Up", width: width * .5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
