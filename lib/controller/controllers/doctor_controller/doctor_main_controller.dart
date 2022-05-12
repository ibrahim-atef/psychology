import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_chat_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_home_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_profile_screen.dart';

class MainDoctorController extends GetxController {
  static const List<Widget> doctorScreens = [
    DoctorHomeScreen(),
    DoctorChatScreen(),
    DoctorProfileScreen(),
  ];
}
