import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/patient_controller/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/styles.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/nested_appointments_List.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class BookingDetailsScreen extends StatelessWidget {
  final controller = Get.find<PatientHomeScreenController>();
  String doctorId = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          builder: (PatientHomeScreenController patientHomeScreenController) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              IconBroken.Arrow___Left_2,
                              size: Get.width * .089,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KTextUtils(
                                  text: "Please select time slots:",
                                  size: 16,
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                  textDecoration: TextDecoration.none),
                              KTextUtils(
                                  text: "Time zone (Africa/Cairo) ",
                                  size: 16,
                                  color: darkGrey.withOpacity(.7),
                                  fontWeight: FontWeight.bold,
                                  textDecoration: TextDecoration.none)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: Get.height * .815,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            child: NestedAppointmentListView(
                              day: controller.daysDateList[index].toString(),
                              doctorId: doctorId,
                            ),
                          );
                        },
                        itemCount: 7,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
