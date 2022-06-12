import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/model/doctor_info_model.dart';
import 'package:psychology/model/patint_info_model.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_chat_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_home_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_profile_screen.dart';
import 'package:psychology/view/screens/patient_screens/blogs_screen.dart';

class MainDoctorController extends GetxController {
  @override
  void onInit() async {
    await GetStorage.init();
    getMyData();
    super.onInit();
  }

  GetStorage storageBox = GetStorage();
  final myData = Rxn<UserModel>();
  List<Widget> doctorScreens = [
    DoctorHomeScreen(),
    DoctorChatScreen(),
    BlogsScreen(),
    DoctorProfileScreen(),
  ];
  int bottomNavSelectedIndex = 0;

  void bottomTapped(int index) {
    bottomNavSelectedIndex = index;

    update();
  }

  getMyData() async {
    FireStoreMethods()
        .doctors
        .doc(storageBox.read(KUid))
        .snapshots()
        .listen((event) {
      if (event.exists) {
        myData.value = UserModel.fromMap(event);
        update();
      } else {
   print("doctor Data not found0000");
      }
    });
  }
}
