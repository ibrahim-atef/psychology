import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_home_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/view/widgets/utils_widgets/height_size_box.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class AppointmentsGridView extends StatelessWidget {
  final doctorHomeController = Get.put(DoctorHomeController());

  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (DoctorHomeController doctorHomeController) {
        return Expanded(
          child: Container(
            width: Get.width,
            child: doctorHomeController.currentDayAppointmentsList.isEmpty
                ? Center(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/images/undraw_add_post_re_174w.svg",
                          width: Get.width * .5,
                          height: Get.width * .5,
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: KTextUtils(
                                text: "You Don't have appointments ",
                                size: Get.width * .04,
                                color: mainColor2,
                                fontWeight: FontWeight.bold,
                                textDecoration: TextDecoration.none))
                      ],
                    ),
                  )
                : GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return doctorHomeController
                                  .currentDayAppointmentsList[index].dayDate !=
                              doctorHomeController.currentDateTime.toString()
                          ? buildS()
                          : AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1000),
                              child: SlideAnimation(
                                horizontalOffset:index==0||index%2==0? -300:300,
                                child: FadeInAnimation(
                                  child: buildCard(
                                    doctorHomeController
                                        .currentDayAppointmentsList[index]
                                        .startTime!,
                                    doctorHomeController
                                        .currentDayAppointmentsList[index]
                                        .endTime!,
                                    doctorHomeController
                                        .currentDayAppointmentsList[index]
                                        .price!,
                                    doctorHomeController
                                        .currentDayAppointmentsList[index]
                                        .isTaken!,
                                  ),
                                ),
                              ),
                            );
                    },
                    itemCount:
                        doctorHomeController.currentDayAppointmentsList.length,
                  ),
          ),
        );
      },
    );
  }

  Widget buildCard(String from, String to, String price, bool isTaken) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KTextUtils(
                  text: from,
                  size: Get.width * .045,
                  color: mainColor2,
                  fontWeight: FontWeight.w900,
                  textDecoration: TextDecoration.none),
              KTextUtils(
                  text: ":",
                  size: Get.width * .045,
                  color: mainColor2,
                  fontWeight: FontWeight.w900,
                  textDecoration: TextDecoration.none),
              KTextUtils(
                  text: to,
                  size: Get.width * .045,
                  color: mainColor2,
                  fontWeight: FontWeight.w900,
                  textDecoration: TextDecoration.none),
            ],
          ),
          HeightSizeBox(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KTextUtils(
                  text: "price:",
                  size: Get.width * .045,
                  color: mainColor2,
                  fontWeight: FontWeight.w900,
                  textDecoration: TextDecoration.none),
              KTextUtils(
                  text: price +" EGP",
                  size: Get.width * .045,
                  color: mainColor2,
                  fontWeight: FontWeight.w900,
                  textDecoration: TextDecoration.none),
            ],
          ),
          HeightSizeBox(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KTextUtils(
                  text: "is Booked:",
                  size: Get.width * .045,
                  color: mainColor2,
                  fontWeight: FontWeight.w900,
                  textDecoration: TextDecoration.none),
              KTextUtils(
                  text: isTaken.toString(),
                  size: Get.width * .045,
                  color: mainColor2,
                  fontWeight: FontWeight.w900,
                  textDecoration: TextDecoration.none),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildS() {
    return SizedBox(width: 1, height: 1);
  }
}
