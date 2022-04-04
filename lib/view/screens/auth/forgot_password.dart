import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/auth/auth_button.dart';
import 'package:psychology/view/widgets/utils_widgets/icon_botton_utils.dart';
import 'package:psychology/view/widgets/on_boarding_widgets/app_icon_and_name.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

import '../../../controller/controllers/auth_controller.dart';
 import '../../widgets/auth/auth_text_from_field.dart';

class ForgotPassword extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background.jpg",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [      SizedBox(
                height: height * .03,
              ),
                // الايكون back
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    KIconButtom(
                        icon: Icons.arrow_back_ios,
                        color: Colors.white,
                        size: SizeConfig.defaultSize!*2,
                        function: () {
                          Get.back();
                        })
                  ],
                ),

                // الايكون back
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SizedBox(
                //       width: 200,
                //     ),
                //     KIconButtom(
                //         icon: Icons.arrow_back_ios,
                //         color: Colors.white,
                //         size: 50,
                //         function: () {Get.back();})
                //   ],
                // ),
                // الصورة والنص
                AppIconAndName(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15,
                ),
                // النص

                SizedBox(
                  height: 65,
                ),
                // نص ال login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KTextUtils(
                          text: "Reset Password",
                          size: 30,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                          textDecoration: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(     prefixIcon: Icon(
                              Icons.email_outlined,
                              color: white,
                            ),
                              suffixIcon: Text(""),
                              controller: emailController,
                              obscureText: false,
                              validator: (value) {
                                if (!RegExp(validationEmail).hasMatch(value)) {
                                  return "Invalid Email";
                                } else {
                                  return null;
                                }
                              },
                              hintText: 'Email',
                              textInputType: TextInputType.text,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: height * .25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.resetPassWord(
                                  emailController.text.trim());
                            }
                          },
                          text:controller.isLoading==false? Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
                          ):SizedBox(
                              width: SizeConfig.defaultSize,
                              height: SizeConfig.defaultSize,
                              child: CircularProgressIndicator(
                                color: mainColor,
                              )),
                          width: MediaQuery.of(context).size.width / 1.3);
                    }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // نص sign up

              ],
            ),
          ),
        ),
      ),
    );
  }
}
