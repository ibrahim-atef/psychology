import 'package:get/get.dart';
import 'package:psychology/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    Future.delayed(
        Duration(seconds: 3), () {
      Get.toNamed(Routes.OnBoardingScreen);
    });
    super.onInit();
  }
}
