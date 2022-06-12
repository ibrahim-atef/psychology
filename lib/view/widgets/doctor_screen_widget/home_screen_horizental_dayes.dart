import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_home_controller.dart';

import '../../../utils/constants.dart';

class DaysListView extends StatelessWidget {
  final doctorHomeController = Get.put(DoctorHomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorHomeController>(
      builder: (_) {
        return Container(
          height: Get.height * .11,
          width: Get.width,
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: doctorHomeController.currentDateTime,
            selectedTextColor: white,
            selectionColor: mainColor2,
            daysCount: 7,
            onDateChange: (newDate) {
              doctorHomeController.getSpecificAppointmentsList(newDate);

              doctorHomeController.changeSelectedDateTime(newDate);
          //    doctorHomeController.getMyAppointments();
              print(newDate);
            },
          ),
        );
      },
    );
  }
}
