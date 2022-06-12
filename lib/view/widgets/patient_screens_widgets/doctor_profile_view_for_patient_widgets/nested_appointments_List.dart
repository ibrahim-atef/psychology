import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/patient_controller/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class NestedAppointmentListView extends StatelessWidget {
  final patientHomeScreenController = Get.put(PatientHomeScreenController());
  String day;

  @override
  Widget build(BuildContext context) {
    return Container(height: Get.height*.1,
      child: GetX(
        builder: (PatientHomeScreenController patientHomeScreenController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KTextUtils(
                  text: day,
                  size: Get.width * .05,
                  color: darkGrey,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.none),
              Container(width: Get.width,height: Get.height*.07,
                child: Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(width: 5,);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 4,);
                      },
                      itemCount:
                          patientHomeScreenController.appointmentsList.length),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  NestedAppointmentListView({
    required this.day,
  });
}
