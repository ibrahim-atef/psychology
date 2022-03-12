import 'package:get/get.dart';
import 'package:psychology/controller/bindings/splash_binding.dart';
 import 'package:psychology/view/screens/auth/doctor_register_screen.dart';
import 'package:psychology/view/screens/auth/login_screen.dart';
import 'package:psychology/view/screens/splash_page_view/on_boarding_screen.dart';
import 'package:psychology/view/screens/auth/patient_register_screen.dart';
import 'package:psychology/view/screens/splash_page_view/splash_screen.dart';

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
    ),
    GetPage(
      name: Routes.patientRegisterScreen,
      page: () => PatientRegisterScreen(),
    ),
    GetPage(
      name: Routes.doctorRegisterScreen,
      page: () => DoctorRegisterScreen(),
    ),
  ];
}

class Routes {
  static const SplashScreen = "/SplashScreen";
  static const OnBoardingScreen = "/OnBoardingScreen";
  static const loginScreen = "/loginScreen";
  static const patientRegisterScreen = "/patientRegisterScreen";
  static const doctorRegisterScreen = "/doctorRegisterScreen";
}
