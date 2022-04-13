import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/patient_home_screen_controller.dart';
import 'package:psychology/model/doctor_info_model.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/home_widgets/home_screen_doctor_container_bocking.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

import '../../../../utils/constants.dart';

class PopularDoctorsListView extends StatelessWidget {
  PopularDoctorsListView({Key? key}) : super(key: key);
  final controller = Get.put(PatientHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientHomeScreenController>(
      builder: (_) {
        controller.getDoctorsInfo();
        return controller.doctorsList != null
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: SizeConfig.defaultSize,
                      width: SizeConfig.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KTextUtils(
                              text: "Popular Doctors",
                              size: SizeConfig.defaultSize! * 1.05,
                              color: black,
                              fontWeight: FontWeight.w800,
                              textDecoration: TextDecoration.none),
                          // InkWell(
                          //   onTap: () {},
                          //   child: KTextUtils(
                          //       text: "See More",
                          //       size: 16,
                          //       color: mainColor2,
                          //       fontWeight: FontWeight.w600,
                          //       textDecoration: TextDecoration.none),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.defaultSize! * 7.1,
                      child: controller.doctorsList != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return HomeScreenDoctorContainerBocking(
                                  imageUrl:
                                      controller.doctorsList[index].profileUrl,
                                  name:
                                      controller.doctorsList[index].displayName,
                                  description:
                                      controller.doctorsList[index].email,
                                  uid: controller.doctorsList[index].uid,
                                );
                              },
                              itemCount: controller.doctorsList.length,
                            )
                          : Center(
                              child: Container(
                                  child: CircularProgressIndicator(
                              color: mainColor,
                            ))),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 10),
                child: const Center(
                  child: Text(
                    "Doctors Will be added soon...",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              );
      },
    );
  }
}
