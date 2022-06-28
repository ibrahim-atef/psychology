import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/call_controller.dart';

class ActivateDoctorAccountWrap extends StatelessWidget {
  final Widget scaffold;
  final callController = Get.put(CallController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return callController.isComingCall.value == true
          ? Obx(() {
              return callController.comingCall.value!.hasDialled == false
                  ? Scaffold(
                      body: Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      )
                  : scaffold;
            })
          : scaffold;
    });
  }

  ActivateDoctorAccountWrap({
    required this.scaffold,
  });
}
