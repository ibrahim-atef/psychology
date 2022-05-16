import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';

class DoctorProfileScreen extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
