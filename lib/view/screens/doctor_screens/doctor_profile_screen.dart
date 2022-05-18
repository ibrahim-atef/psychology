import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';
import 'package:psychology/view/screens/call_screens/answer_call/answer_call_wrap_layout.dart';

class DoctorProfileScreen extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return AnswerCallWrapLayout(
      scaffold: Scaffold(
        body: Center(
          child: GetBuilder(
            builder: (AuthController authController) {
              return InkWell(
                onTap: () {
                  authController.signOutFromApp();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("profile"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
