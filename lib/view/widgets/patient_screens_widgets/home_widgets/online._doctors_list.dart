import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/home_widgets/online_doctors_stack_widget.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/size_config.dart';

class DoctorOnlineList extends StatelessWidget {
  const DoctorOnlineList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: SizeConfig.defaultSize! * 1.3,
          width: SizeConfig.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              KTextUtils(
                  text: "Online Doctors",
                  size: SizeConfig.defaultSize! * 1.05,
                  color: black,
                  fontWeight: FontWeight.w800,
                  textDecoration: TextDecoration.none),
            ],
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.defaultSize! * 9,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return OnlineDoctorsStackWidget();
            },
          ),
        ),
      ],
    );
  }
}
