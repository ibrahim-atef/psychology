import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/call_controller.dart';

import 'answer_call_screen.dart';

class AnswerCallWrapLayout extends StatelessWidget {
  final Widget scaffold;
  final callController = Get.put(CallController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return callController.isComingCall.value == true
          ? Obx(() {
              return callController.comingCall.value!.hasDialled == false
                  ? AnswerCallScreen(call: callController.comingCall.value!)
                  : scaffold;
            })
          : scaffold;
    });
  }

  AnswerCallWrapLayout({
    required this.scaffold,
  });
}
