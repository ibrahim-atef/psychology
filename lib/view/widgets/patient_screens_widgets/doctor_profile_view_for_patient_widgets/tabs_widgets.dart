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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: KTextUtils(
                text: "Profile",
                size: SizeConfig.defaultSize!*1.4,
                color: black,
                fontWeight: FontWeight.w600,
                textDecoration: TextDecoration.none),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: KTextUtils(
                text: "Reviews",
                size: SizeConfig.defaultSize!*1.4,
                color: black,
                fontWeight: FontWeight.w600,
                textDecoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }


}

