import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psychology/view/screens/patient_screens/blogs_screen.dart';
import 'package:psychology/view/screens/patient_screens/chat_screen.dart';
import 'package:psychology/view/screens/patient_screens/home_screen.dart';
import 'package:psychology/view/screens/patient_screens/profile_screen.dart';

class MainPatientController extends GetxController {

  @override
  void onInit() async {
    // TODO: implement onInit
   bottomSelectedIndex=0;
   update();
    super.onInit();
  }
  List<Widget> screens = [
     PatientHomeScreen(),
     PatientChatScreen(),
     BlogsScreen(),
      PatientProfileScreen(),
  ];

  int bottomSelectedIndex = 0;
  PageController pageController = PageController();

  void bottomTapped(int index) {
    bottomSelectedIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    update();
  }

  void pageChanged(int index) {
    bottomSelectedIndex = index;
    update();
  }
}
