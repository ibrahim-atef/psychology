import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/main_patient_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';

class PatientMainScreen extends StatelessWidget {
  PatientMainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainPatientController>();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<MainPatientController>(
      builder: (_) {
        return Scaffold(
            body: PageView(
              onPageChanged: (val) {
                controller.pageChanged(val);
              },
              controller: controller.pageController,
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              children: controller.screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.green,
              currentIndex: controller.bottomSelectedIndex,
              onTap: (index) {
                controller.bottomTapped(index);
              },
              unselectedItemColor: grey,
              selectedItemColor: mainColor2,
              items: [
                buildBottomNavigationBarItem(Icons.home),
                buildBottomNavigationBarItem(Icons.chat),
                buildBottomNavigationBarItem(Icons.blender),
                buildBottomNavigationBarItem(Icons.account_circle),
              ],
            ));
      },
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData iconData) {
    return BottomNavigationBarItem(backgroundColor: homeBackGroundColor,
      label: "",
      icon: Icon(
        iconData,
        size: SizeConfig.defaultSize! * 1.6,
      ),
    );
  }
}
