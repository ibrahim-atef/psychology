import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';

class DoctorMainScreen extends StatelessWidget {
  DoctorMainScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<AuthController>(
          builder: (_) {
            return InkWell(
                onTap: () {
                  controller.signOutFromApp();
                },
                child: Text("LogOut"));
          },
        ),
      ),
    );
  }
}
