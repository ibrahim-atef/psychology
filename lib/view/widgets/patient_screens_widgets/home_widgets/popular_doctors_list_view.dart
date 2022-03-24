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
    return Padding(
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
            child: GetBuilder<PatientHomeScreenController>(
              builder: (_) {
                return StreamBuilder<QuerySnapshot>(
                    stream: controller.doctorsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        controller.doctorsList.clear();

                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          controller.doctorsList
                              .add(DoctorInfo.fromJson(snapshot.data!.docs[i]));
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HomeScreenDoctorContainerBocking(
                              imageUrl:
                              controller.doctorsList[index].profileUrl,
                              name: controller.doctorsList[index].displayName,
                              description: controller.doctorsList[index].email,
                              uid
                              : controller.doctorsList[index].uid,
                            );
                          },
                          itemCount: controller.doctorsList.length,
                        );
                      } else {
                        return Center(
                            child: Container(
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                )));
                      }
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
