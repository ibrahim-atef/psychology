import 'package:get/get.dart';
import 'package:psychology/controller/bindings/auth_binding.dart';
import 'package:psychology/controller/bindings/doctor_home_binding.dart';
import 'package:psychology/controller/bindings/main_doctor_binding.dart';
import 'package:psychology/controller/bindings/main_patient_binding.dart';
import 'package:psychology/controller/bindings/message_binding.dart';
import 'package:psychology/controller/bindings/pateint_home_screen_binding.dart';
import 'package:psychology/controller/bindings/splash_binding.dart';
import 'package:psychology/view/screens/chat/chat_screen.dart';
import 'package:psychology/view/screens/auth/doctor_register_screen.dart';
import 'package:psychology/view/screens/auth/forgot_password.dart';
import 'package:psychology/view/screens/auth/login_screen.dart';
import 'package:psychology/view/screens/doctor_screens/add_appointment_screen.dart';
import 'package:psychology/view/screens/doctor_screens/add_blog_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_main_screen.dart';
import 'package:psychology/view/screens/patient_screens/patient_main_screen.dart';
import 'package:psychology/view/screens/splash_page_view/on_boarding_screen.dart';
import 'package:psychology/view/screens/auth/patient_register_screen.dart';
import 'package:psychology/view/screens/splash_page_view/splash_screen.dart';
import 'package:psychology/view/screens/patient_screens/booking_details_screen.dart';

import '../view/screens/patient_screens/doctor_profile_view_for_patient.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: Routes.SplashScreen,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.OnBoardingScreen,
        page: () => OnBoardingScreen(),
        binding: SplashBinding()),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 1000),
      //testing auth
      bindings: [
        AuthBinding(),
      ],
    ),
    GetPage(
        name: Routes.patientRegisterScreen,
        page: () => PatientRegisterScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.doctorRegisterScreen,
        page: () => DoctorRegisterScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.patientMainScreen,
        page: () => PatientMainScreen(),
        bindings: [
          AuthBinding(),
          MainPatientBinding(),
          PatientHomeScreenBinding()
        ]),
    GetPage(
        name: Routes.doctorMainScreen,
        page: () => DoctorMainScreen(),
        bindings: [AuthBinding(), MainDoctorBinding()]),
    GetPage(
        name: Routes.forgotPassword,
        page: () => ForgotPassword(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.doctorProfileViewForPatient,
        page: () => DoctorProfileViewForPatient(),
        binding: PatientHomeScreenBinding()),    GetPage(
        name: Routes.bookingDetailsScreen,
        page: () => BookingDetailsScreen(),
        binding: PatientHomeScreenBinding()),
    GetPage(
        name: Routes.chatScreen,
        page: () => ChatScreen(),
        transition: Transition.rightToLeft,
        bindings: [
          MessagesBinding(),
        ]),
    GetPage(
        name: Routes.aggBlogScreen,
        page: () => AddBlogScreen(),
        transition: Transition.downToUp,
        binding: DoctorHomeBinding()),
    GetPage(
        name: Routes.addAppointmentScreen,
        page: () => AddAppointmentScreen(),
        transition: Transition.downToUp,
        binding: DoctorHomeBinding()),
  ];
}

class Routes {
  static const SplashScreen = "/SplashScreen";
  static const OnBoardingScreen = "/OnBoardingScreen";
  static const loginScreen = "/loginScreen";
  static const patientRegisterScreen = "/patientRegisterScreen";
  static const doctorRegisterScreen = "/doctorRegisterScreen";
  static const patientMainScreen = "/patientMainScreen";
  static const doctorMainScreen = "/doctorMainScreen";
  static const forgotPassword = "/forgotPassword";
  static const chatScreen = "/chatScreen";

  static const doctorProfileViewForPatient = "/doctorProfileViewForPatient";
  static const addAppointmentScreen = "/addAppointmentScreen";
  static const bookingDetailsScreen = "/bookingDetailsScreen";
  static const aggBlogScreen = "/aggBlogScreen";
}
