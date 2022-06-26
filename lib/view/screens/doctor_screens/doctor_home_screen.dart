import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_home_controller.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_main_controller.dart';
import 'package:psychology/routes/routes.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/styles.dart';
import 'package:psychology/view/widgets/doctor_screen_widget/home_screen_horizental_dayes.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

import '../../widgets/doctor_screen_widget/appointments_grid_view.dart';
import '../../widgets/utils_widgets/text_utils.dart';
import '../call_screens/answer_call/answer_call_wrap_layout.dart';

class DoctorHomeScreen extends StatelessWidget {
  // final mainDoctorController = Get.find<MainDoctorController>();
  final doctorHomeController = Get.put(DoctorHomeController());

  @override
  Widget build(BuildContext context) {
    return AnswerCallWrapLayout(
      scaffold: Scaffold(
        backgroundColor: homeBackGroundColor,
        appBar: AppBar(
          leadingWidth: 0,
          leading: SizedBox(
            width: 0,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
          backgroundColor: mainColor2,
          elevation: 2,
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              // SizedBox(
              //   height: Get.height * .05,
              // ),
              GetBuilder(
                builder: (MainDoctorController mainDoctorController) {
                  return mainDoctorController.myData.value == null
                      ? LinearProgressIndicator(
                          color: mainColor2,
                          minHeight: 2,
                        )
                      : SizedBox(
                          height: Get.height * .12,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CirculeImageAvatar(
                                  imageUrl: mainDoctorController
                                      .myData.value!.profileUrl!,
                                  width: Get.width * .233),
                              SizedBox(
                                width: Get.height * .01,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  KTextUtils(
                                      text: "Hello,",
                                      size: 18,
                                      color: darkGrey,
                                      fontWeight: FontWeight.w500,
                                      textDecoration: TextDecoration.none),
                                  KTextUtils(
                                      text: "Dr " +
                                          mainDoctorController
                                              .myData.value!.displayName
                                              .toString(),
                                      size: 22,
                                      color: darkGrey,
                                      fontWeight: FontWeight.w600,
                                      textDecoration: TextDecoration.none),
                                ],
                              )
                            ],
                          ));
                },
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              GetBuilder(
                builder: (MainDoctorController mainDoctorController) {
                  return Container(
                    height: Get.height * .05,
                    width: Get.width * .94,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: mainColor2, width: 1.3)),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.aggBlogScreen,
                            arguments: [mainDoctorController.myData.value!]);
                      },
                      child: Card(
                        color: homeBackGroundColor,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconBroken.Edit,
                                    color: mainColor4,
                                    size: 20,
                                  ),
                                  Text(
                                    "Write New Blog",
                                    style: TextStyle(
                                        fontFamily: "cairo", color: mainColor4),
                                  )
                                ],
                              ),
                              Icon(
                                IconBroken.Image,
                                color: mainColor4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: KTextUtils(
                    text: "Appointments",
                    size: Get.width * .05,
                    color: black,
                    fontWeight: FontWeight.bold,
                    textDecoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 5,
              ),
              DaysListView(),
              AppointmentsGridView()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.addAppointmentScreen);
            // Get.defaultDialog(
            //     titlePadding: EdgeInsets.zero,
            //     titleStyle: TextStyle(fontSize: 0),
            //     content: Padding(
            //       padding: EdgeInsets.all(2),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               KTextUtils(
            //                   text: "Date",
            //                   size: Get.width * .04,
            //                   color: black,
            //                   fontWeight: FontWeight.bold,
            //                   textDecoration: TextDecoration.none),
            //               addDate(() {},
            //                   "${doctorHomeController.currentDateTime.day}/${doctorHomeController.currentDateTime.month}")
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               KTextUtils(
            //                   text: "from",
            //                   size: Get.width * .04,
            //                   color: black,
            //                   fontWeight: FontWeight.bold,
            //                   textDecoration: TextDecoration.none),
            //               addDate(() {},
            //                   "${doctorHomeController.currentDateTime.day}/${doctorHomeController.currentDateTime.month}")
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               KTextUtils(
            //                   text: "to",
            //                   size: Get.width * .04,
            //                   color: black,
            //                   fontWeight: FontWeight.bold,
            //                   textDecoration: TextDecoration.none),
            //               addDate(() {
            //                 showTimePicker(
            //                         context: context,
            //                         initialTime: TimeOfDay.now())
            //                     .then((value) {
            //                   doctorHomeController.currentDateTime =
            //                       value!.format(context) as DateTime;
            //                   //! 1970-01-01 time selected:00.000
            //                   // print(DateFormat("hh:mm a")
            //                   //     .parse(timecontroller.text.toString()));
            //                 });
            //               }, "${doctorHomeController.currentDateTime.hour}")
            //             ],
            //           ),
            //         ],
            //       ),
            //     ));
          },
          backgroundColor: mainColor2,
          child: Icon(Icons.more_time, color: white),
        ),
      ),
    );
  }

  Widget addDate(Function() onPressed, String date) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * .3,
        height: Get.height * .046,
        margin: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: darkGrey,
            width: 1.3,
          ),
        ),
        child: KTextUtils(
            text: date,
            size: 16,
            color: darkGrey,
            fontWeight: FontWeight.w700,
            textDecoration: TextDecoration.none),
      ),
    );
  }
}
