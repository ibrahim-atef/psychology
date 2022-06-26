import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/model/appointment_model.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  AppointmentModel appointmentModel = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KTextUtils(
            text: "Details",
            size: 20,
            color: mainColor3,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            KTextUtils(
                text: "${appointmentModel.patientName}",
                size: 20,
                color: black,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none)
          ],
        ),
      ),
    );
  }
}
