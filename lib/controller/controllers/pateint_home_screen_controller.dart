import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/tap_bar_profile_widget.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/tap_bar_reviews_widget.dart';

class PateintHomeScreenController extends GetxController{

  List<Widget> tabScreens = [TabBarProfileWidget(),TabBarReviewsWidget()];

}