import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/patient_controller/patient_home_screen_controller.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/nested_appointments_List.dart';

class BookingDetailsScreen extends StatelessWidget {
  final controller = Get.find<PatientHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return NestedAppointmentListView(
              day: controller.daysDateList[index].toString(),
            );
          },
          itemCount: controller.daysDateList.length,
        ),
      ),
    );
  }
}
