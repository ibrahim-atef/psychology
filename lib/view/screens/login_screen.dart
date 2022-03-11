import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psychology/view/widgets/auth/auth_button.dart';
import 'package:psychology/view/widgets/icon_botton_utils.dart';

import '../../routes/routes.dart';
import '../widgets/auth/auth_text_from_field.dart';
import '../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //اللون الاول
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment(0.0, -1.0),
              //     end: Alignment(0, 1.2),
              //     colors: [
              //       Color(0xff5599ff),
              //       Color(0xff5e2ef3),
              //
              //     ]),
              color: Color(0xffaf8bff),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(1200)),
            ),
          ),
          //اللون التاني والتالت
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: double.infinity,
            decoration: BoxDecoration(
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

          //باقي الصفحة
          Column(
            children: [
              SizedBox(height: 20),
              // الايكون back
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                  ),
                  KIconButtom(
                      icon: Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 50,
                      function: () {
                      })
                ],
              ),
              // الصورة والنص
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 71,
                    width: 71,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/splash.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'psychology',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            )),
                        TextSpan(
                            text: ' \nKeep Talking..',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // النص
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: KTextUtils(
                  text: "Welcon to Psychology",
                  size: 17,
                  color: Color(0xff4b455d),
                  fontWeight: FontWeight.normal,
                  textDecoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // نص ال login
              Padding(
                padding: const EdgeInsets.only(right: 240),
                child: KTextUtils(
                  text: "Login",
                  size: 30,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AuthTextFromField(
                controller: emailController,
                obscureText: false,
                validator: () {},
                hintText: 'Email',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              AuthTextFromField(
                controller: passwordController,
                obscureText: false,
                validator: () {},
                hintText: 'Password',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only( left: 160),
                child: TextButton(
                    onPressed: () {},
                    child: KTextUtils(
                      text: "Forget Password",
                      size: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      textDecoration: TextDecoration.underline,
                    )),
              ),
              SizedBox(height: 20,),
              AuthButtom(onPressed: (){}, text: "LogIn", width: MediaQuery.of(context).size.width/1.3),
              SizedBox(height: 30,),
              // نص sign up
              Row(
                children: [
                  KTextUtils(
                    text: "Don’t have an account?",
                    size: 20,
                    color: Color(0xff4b455d),
                    fontWeight: FontWeight.normal,
                    textDecoration: TextDecoration.none,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.patientRegisterScreen);
                      },
                      child: KTextUtils(
                        text: "SignUp",
                        size: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        textDecoration: TextDecoration.underline,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
