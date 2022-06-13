import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:psychology/controller/controllers/patient_controller/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class NestedAppointmentListView extends StatelessWidget {
  final patientHomeScreenController = Get.put(PatientHomeScreenController());
  String day;
  String doctorId;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder(
        builder: (PatientHomeScreenController patientHomeScreenController) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      SizedBox(
                        width: Get.height * .14,
                        child:
                            Divider(color: darkGrey, thickness: 2, height: 1),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KTextUtils(
                      text:
                          "${DateFormat('EEEE, d MMM').format(DateTime.parse(day))}",
                      size: Get.width * .05,
                      color: darkGrey.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                      textDecoration: TextDecoration.none),
                  SizedBox(
                    height: Get.height * .1,
                    width: Get.width * .85,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return patientHomeScreenController
                                      .appointmentsList[index].dayDate ==
                                  day
                              ? buildContainer(
                                  patientHomeScreenController
                                      .appointmentsList[index].startTime!,
                                  patientHomeScreenController
                                      .appointmentsList[index].endTime!,
                                  patientHomeScreenController
                                      .appointmentsList[index]
                                      .price!, () async {
                                  if (patientHomeScreenController
                                          .appointmentsList[index].isTaken ==
                                      false) {
                                    patientHomeScreenController.selectAppointment(
                                        doctorId: doctorId,
                                        startTime: patientHomeScreenController
                                            .appointmentsList[index].startTime!,
                                        endTime: patientHomeScreenController
                                            .appointmentsList[index].endTime!,
                                        dayDate: patientHomeScreenController
                                            .appointmentsList[index].dayDate!,
                                        myImage: patientHomeScreenController
                                            .patientInfoModel
                                            .value!
                                            .profileUrl!,
                                        myName: patientHomeScreenController
                                            .patientInfoModel
                                            .value!
                                            .displayName!,
                                        myToken: patientHomeScreenController
                                            .patientInfoModel.value!.token!,
                                        isTaken: true,
                                        myId: patientHomeScreenController
                                            .patientInfoModel.value!.uid!);
                                  } else {
                                    if (patientHomeScreenController
                                            .appointmentsList[index]
                                            .patientId ==
                                        patientHomeScreenController
                                            .patientInfoModel.value!.uid) {
                                      patientHomeScreenController
                                          .selectAppointment(
                                              doctorId: doctorId,
                                              startTime:
                                                  patientHomeScreenController
                                                      .appointmentsList[index]
                                                      .startTime!,
                                              endTime:
                                                  patientHomeScreenController
                                                      .appointmentsList[index]
                                                      .endTime!,
                                              dayDate:
                                                  patientHomeScreenController
                                                      .appointmentsList[index]
                                                      .dayDate!,
                                              myId: "",
                                              myImage: "",
                                              myName: "",
                                              myToken: "",
                                              isTaken: false);
                                    } else {
                                      Get.snackbar("not available",
                                          "this appointment already booked",
                                          backgroundColor: Color(0xffe9b5b3));
                                    }
                                  }
                                },
                                  patientHomeScreenController
                                              .appointmentsList[index]
                                              .isTaken ==
                                          true
                                      ? patientHomeScreenController
                                                  .appointmentsList[index]
                                                  .patientId ==
                                              patientHomeScreenController
                                                  .patientInfoModel.value!.uid
                                          ? mainColor
                                          : Color(0xffe9b5b3)
                                      : Color(0xffebebeb))
                              : Container(
                                  width: 0,
                                  height: 0,
                                );
                        },
                        itemCount: patientHomeScreenController
                            .appointmentsList.length),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildContainer(
    String from,
    String to,
    String price,
    Function() selectAppointment,
    Color backGroundColor,
  ) {
    return InkWell(
      onTap: selectAppointment,
      child: Container(alignment: Alignment.center,
        margin: EdgeInsets.only(left: 8),
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: Get.height * .12,
        height: Get.height * .1,
        decoration: BoxDecoration(
            color: backGroundColor, borderRadius: BorderRadius.circular(6)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KTextUtils(
                    text: "from:",
                    size: Get.width * .03,
                    color: mainColor2,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none),
                KTextUtils(
                    text: from,
                    size: Get.width * .03,
                    color: mainColor2,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KTextUtils(
                    text: "to:",
                    size: Get.width * .03,
                    color: mainColor2,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none),
                KTextUtils(
                    text: to,
                    size: Get.width * .03,
                    color: mainColor2,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KTextUtils(
                    text: "price :",
                    size: Get.width * .03,
                    color: mainColor2,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none),
                KTextUtils(
                    text: "$price EGP",
                    size: Get.width * .03,
                    color: mainColor2,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none),
              ],
            ),
          ],
        ),
      ),
    );
  }

  NestedAppointmentListView({
    required this.day,
    required this.doctorId,
  });
}
