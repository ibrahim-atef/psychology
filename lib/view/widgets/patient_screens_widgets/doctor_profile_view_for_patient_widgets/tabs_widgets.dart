import 'package:flutter/material.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';

import '../../utils_widgets/text_utils.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 3,
      child: TabBar(
        indicatorColor: Colors.transparent,
        tabs: [
          KTextUtils(
              text: "Profile",
              size: 22,
              color: mainColor2,
              fontWeight: FontWeight.w600,
              textDecoration: TextDecoration.none),
          KTextUtils(
              text: "Reviews",
              size: 22,
              color: mainColor2,
              fontWeight: FontWeight.w600,
              textDecoration: TextDecoration.none),
        ],
      ),
    );
  }
}
