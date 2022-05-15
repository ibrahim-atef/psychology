import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/model/doctor_info_model.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_chat_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_home_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_profile_screen.dart';

class MainDoctorController extends GetxController {
  @override
  void onInit() async {
await GetStorage.init();
    getMyData();
    super.onInit();
  }

  GetStorage storageBox = GetStorage();
  final myData = Rxn<DoctorInfo>();
  List<Widget> doctorScreens = [
    DoctorHomeScreen(),
    DoctorChatScreen(),
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
        myData.value = DoctorInfo.fromJson(event);
        update();
      } else {
        Get.snackbar("doctor Data", "doctor Data not found");
      }
    });
  }
}
