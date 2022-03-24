import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

import '../../../../controller/controllers/patient_home_screen_controller.dart';

class TabBarProfileWidget extends StatelessWidget {
  TabBarProfileWidget({Key? key}) : super(key: key);
  final controller = Get.lazyPut(() => PatientHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            KTextUtils(
                text: "Experience",
                size: 22,
                color: black,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none),
            Container(
              height: SizeConfig.defaultSize! * 20,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: SizedBox(
                        height: SizeConfig.defaultSize! * 3.4,
                        child: Row(
                          children: [
                            GetBuilder<PatientHomeScreenController>(
                              builder: (c) {
                                return Container(
                                  width: SizeConfig.defaultSize! * .8,
                                  height: SizeConfig.defaultSize! * 3,
                                  color: c.colorList[
                                      c.random.nextInt(c.colorList.length)],
                                );
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start,
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
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
