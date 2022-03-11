
import 'package:get/get.dart';
import 'package:psychology/controller/bindings/splash_binding.dart';
import 'package:psychology/view/screens/on_boarding_screen.dart';
import 'package:psychology/view/screens/splash_screen.dart';

class AppRoutes {
  static const welcome = Routes.SplashScreen;
   static final routes = [
  GetPage(
  name: Routes.SplashScreen,
  page: () => SplashScreen(),
  binding: SplashBinding()),
  GetPage(
  name: Routes.OnBoardingScreen,
  page: () => OnBoardingScreen(),
  ),
   ];
}

class Routes {
  static const SplashScreen = "/SplashScreen";
  static const OnBoardingScreen = "/OnBoardingScreen";
}