import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';
import 'package:psychology/controller/controllers/patient_home_screen_controller.dart';

class PatientProfileScreen extends StatelessWidget {
  PatientProfileScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  final cc = Get.put(PatientHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column
          (mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            Center(
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
            Center(
              child: GetBuilder<PatientHomeScreenController>(
                builder: (_) {
                  return InkWell(
                      onTap: () {
                        // cc.getDooctorsInfo();
                      },
                      child: Text("DoctorData"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
