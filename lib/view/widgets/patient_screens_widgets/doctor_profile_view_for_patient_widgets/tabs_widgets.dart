import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';

import '../../utils_widgets/text_utils.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: TabBar(
        indicatorColor: Colors.transparent,
        tabs: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: KTextUtils(
                text: "Profile",
                size: Get.height*.025,
                color: black,
                fontWeight: FontWeight.w800,
                textDecoration: TextDecoration.none),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: KTextUtils(
                text: "Reviews",
                size: Get.height*.025,
                color: black,
                fontWeight: FontWeight.w800,
                textDecoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }


}

