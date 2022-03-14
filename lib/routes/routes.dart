import 'package:get/get.dart';
import 'package:psychology/controller/bindings/auth_binding.dart';
import 'package:psychology/controller/bindings/splash_binding.dart';
import 'package:psychology/view/screens/auth/doctor_register_screen.dart';
import 'package:psychology/view/screens/auth/forgot_password.dart';
import 'package:psychology/view/screens/auth/login_screen.dart';
import 'package:psychology/view/screens/doctor_screens/doctor_main_screen.dart';
import 'package:psychology/view/screens/patient_screens/patient_main_screen.dart';
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
      //testing auth
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.patientRegisterScreen,
      page: () => PatientRegisterScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Routes.doctorRegisterScreen,
      page: () => DoctorRegisterScreen(),
        binding: AuthBinding()

    ),
    GetPage(
      name: Routes.patientMainScreen,
      page: () => PatientMainScreen(),
      binding: AuthBinding()
    ),   GetPage(
      name: Routes.doctorMainScreen,
      page: () => DoctorMainScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPassword(),
      binding: AuthBinding()
    ),
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
}
