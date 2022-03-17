import 'package:get/get.dart';
import 'package:psychology/view/screens/patient_screens/blogs_screen.dart';
import 'package:psychology/view/screens/patient_screens/chat_screen.dart';
import 'package:psychology/view/screens/patient_screens/home_screen.dart';
import 'package:psychology/view/screens/patient_screens/profile_screen.dart';

class MainPatientController extends GetxController {
  List screens = [
    PatientHomeScreen(),
    PatientChatScreen(),
    BlogsScreen(),
    PatientProfileScreen(),
  ];
}
