import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/model/doctor_info_model.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/first_tap_bar_column.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/tap_bar_profile_widget.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/tap_bar_reviews_widget.dart';

 class PatientHomeScreenController extends GetxController {
  Stream<QuerySnapshot>? doctorsStream;
  List<dynamic> doctorsList = <DoctorInfo>[].obs;
  List<Widget> tabScreens = [FirstTapBarWidget(), TabBarReviewsWidget()];
  List<Color> colorList = [
    Color(0xffFFD93D),
    mainColor2,
    Color(0xffF190B7),
    Color(0xff97DBAE),
  ];

  String? email;
  String? name;
  var gender;
  var isDoctor;
  var imageUrl;
  var phoneNumber;
  var uid;

  Random random = new Random();

  @override
  void onInit() async {
    GetStorage authBox = GetStorage();

    // TODO: implement onInit
    email =await authBox.read(KEmail);
    name =await authBox.read(KName);
    gender = authBox.read(KGender);
    isDoctor = authBox.read(KIsDoctor);
    imageUrl =await authBox.read(KImageUrl);
    phoneNumber =await authBox.read(KPhoneNumber);
    uid =await authBox.read(KUid);
    update();
    getDoctorsInfo();
    super.onInit();
  }

  getDoctorsInfo() async {
    doctorsList = [];
    // userStream = await FireStoreMethods().GetUserByUserName(textEditingController.text);
    doctorsStream = await FireStoreMethods().doctors.snapshots();

    update();
  }
}
