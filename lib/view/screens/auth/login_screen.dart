import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/view/widgets/auth/auth_button.dart';
import 'package:psychology/view/widgets/on_boarding_widgets/app_icon_and_name.dart';

import '../../../controller/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  LoginScreen({Key? key}) : super(key: key);

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
              children: [
                const SizedBox(height: 50), // afroto
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: KTextUtils(
                    text: "Welcon to Psychology",
                    size: 17,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.normal,
                    textDecoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
                // نص ال login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KTextUtils(
                        text: "Login",
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
                          return AuthTextFromField(
                            controller: emailController,
                            obscureText: false,
                            validator: () {},
                            hintText: 'Email',
                            textInputType: TextInputType.text,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText: false,
                            validator: () {},
                            hintText: 'Password',
                            textInputType: TextInputType.text,
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: KTextUtils(
                                text: "Forget Password",
                                size: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                textDecoration: TextDecoration.underline,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: height * .1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                          onPressed: () {
                             String email = emailController.text.trim();
                            String password = passwordController.text;


                            controller.Register(
                                email: email, password: password);
                          },
                          text: "Login",
                          width: MediaQuery.of(context).size.width / 1.3);
                    }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // نص sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KTextUtils(
                      text: "Don’t have an account?",
                      size: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      textDecoration: TextDecoration.none,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.patientRegisterScreen);
                        },
                        child: KTextUtils(
                          text: "SignUp",
                          size: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          textDecoration: TextDecoration.underline,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
