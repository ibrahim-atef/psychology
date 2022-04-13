import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

import '../../../../controller/controllers/patient_home_screen_controller.dart';

class TabBarProfileWidget extends StatelessWidget {
  String field;
  final controller = Get.lazyPut(() => PatientHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KTextUtils(
              text: field,
              size: 22,
              color: black,
              fontWeight: FontWeight.bold,
              textDecoration: TextDecoration.none),
          SizedBox(
            height: SizeConfig.defaultSize! * .98,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: SizeConfig.defaultSize! * 3.4,
                  child: Row(
                    children: [
                      GetBuilder<PatientHomeScreenController>(
                        builder: (c) {
                          return Container(
                            width: SizeConfig.defaultSize! * .8,
                            height: SizeConfig.defaultSize! * 3,
                            color: c.colorList[index] == null
                                ? mainColor2
                                : c.colorList[index],
                          );
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KTextUtils(
                              text: "Training And Treatment",
                              size: 19,
                              color: black,
                              fontWeight: FontWeight.bold,
                              textDecoration: TextDecoration.none),
                          KTextUtils(
                              text: "Helwan Hospital for Mental Health",
                              size: 15,
                              color: grey,
                              fontWeight: FontWeight.w600,
                              textDecoration: TextDecoration.none),
                          KTextUtils(
                              text: "sep 2019 - Feb 2012",
                              size: 12,
                              color: yelloo,
                              fontWeight: FontWeight.w600,
                              textDecoration: TextDecoration.none),
                        ],
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  TabBarProfileWidget({
    required this.field,
  });
}
