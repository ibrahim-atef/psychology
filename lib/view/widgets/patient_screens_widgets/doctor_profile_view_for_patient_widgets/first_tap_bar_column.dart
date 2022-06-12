import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';

import 'tap_bar_profile_widget.dart';

class FirstTapBarWidget extends StatelessWidget {
  const FirstTapBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: homeBackGroundColor,
      body: ListView(
        children: [
           TabBarProfileWidget(
            field: 'Experience',
          ),
          SizedBox(height: SizeConfig.defaultSize,),
          TabBarProfileWidget(
            field: 'Education',
          ),
        ],
      ),
    );
  }
}
