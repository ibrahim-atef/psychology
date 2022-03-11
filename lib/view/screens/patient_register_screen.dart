import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/routes/routes.dart';
import 'package:psychology/utils/themes.dart';
import 'package:psychology/view/widgets/auth/auth_button.dart';
import 'package:psychology/view/widgets/auth/auth_text_from_field.dart';
import 'package:psychology/view/widgets/auth/gender_widget.dart';
import '../widgets/icon_botton_utils.dart';
import '../widgets/text_utils.dart';

class PatientRegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  PatientRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffaf8bff),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(1200)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0, 1.2),
                  colors: [
                    Color(0xff5599ff),
                    Color(0xff5e2ef3),
                  ]),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(1200)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
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
                        height: 10,
                      ),
                      GenderWidget(),
                      SizedBox(
                        height: 25,
                      ),
                      AuthButtom(
                          onPressed: () {}, text: "Sign Up", width: width * .5),

                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Expanded(
                              child: Divider(
                            color: Colors.black54,
                            endIndent: 5,
                            thickness: .5,
                          )),
                          Text(
                            "Or continue with",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.black54,
                            indent: 5,
                            thickness: .5,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Container(
                                width: width * .076,
                                height: width * .076,
                                child: Image.asset(
                                  "assets/images/google.png",
                                ),
                              )),
                          SizedBox(
                            width: width * .05,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.doctorRegisterScreen);
                            },
                            child: KTextUtils(
                              text: "Register as a doctor !?",
                              color: black,
                              fontWeight: FontWeight.w500,
                              size: 15,
                              textDecoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
