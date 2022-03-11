import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychology/view/widgets/auth/auth_text_from_field.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
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
          ),
          Expanded(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1.2,
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
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
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
                        function: () {})
                  ],
                ),
                // الصورة
                Row(
                  children: [
                    SizedBox(
                      width: 140,
                    ),
                    Container(
                      height: 81,
                      width: 81,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
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
                  thickness: 1.5,
                ),
                SizedBox(height: 20,),
                // full name
                AuthTextFromField(controller: nameController,
                  obscureText: false,
                  validator: () {},
                  hintText: 'Full Name:',
                  textInputType:TextInputType.text,
                ),
                SizedBox(height: 10,),
                //Email address
                AuthTextFromField(controller: emailController,
                  obscureText: false,
                  validator: () {},
                  hintText: 'Email address:',
                  textInputType:TextInputType.emailAddress,
                ),
                SizedBox(height: 10,),
                //Phone number
                AuthTextFromField(controller: phoneController,
                  obscureText: false,
                  validator: () {},
                  hintText: 'Phone number:',
                  textInputType:TextInputType.phone,
                ),
                SizedBox(height: 10,),
                //password
                AuthTextFromField(controller: passwordController,
                  obscureText: false,
                  validator: () {},
                  hintText: 'Phone number:',
                  textInputType:TextInputType.visiblePassword,
                ),
                SizedBox(height: 10,),





              ],
            ),
          ),
        ],
      ),
    );
  }
}
