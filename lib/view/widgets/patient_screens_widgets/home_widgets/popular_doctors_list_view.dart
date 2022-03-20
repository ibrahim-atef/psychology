import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/home_widgets/home_screen_doctor_container_bocking.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

import '../../../../utils/constants.dart';

class PopularDoctorsListView extends StatelessWidget {
  const PopularDoctorsListView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 5),
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
                InkWell(
                  onTap: () {},
                  child: KTextUtils(
                      text: "See More",
                      size: 16,
                      color: mainColor2,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.none),
                )
              ],
            ),
          ),
          SizedBox(height: 5,),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.defaultSize! * 7.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HomeScreenDoctorContainerBocking();
              },
              itemCount: 11,
            ),
          ),
        ],
      ),
    );
  }
}


