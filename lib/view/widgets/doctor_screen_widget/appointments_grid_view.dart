import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_home_controller.dart';
import 'package:psychology/utils/constants.dart';

class AppointmentsGridView extends StatelessWidget {
  final doctorHomeController = Get.put(DoctorHomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorHomeController>(
      builder: (_) {
        return Expanded(
          child: Container(
            width: Get.width,
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: white,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
