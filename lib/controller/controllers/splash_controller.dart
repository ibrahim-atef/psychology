import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psychology/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(Routes.OnBoardingScreen);
    });
    super.onInit();
  }

/////onBoarding logic
  RxBool isLast = false.obs;

  PageController pageController = PageController();
  Rx<PageController> pageeController = PageController().obs;

  checkController() {
    if (pageeController.value.page != 2) {
      isLast = false.obs;
      update();
    } else if (pageeController.value.page == 2) {
      isLast = true.obs;
      update();
    }
   }

  List<String> lottieViewList = [
    "assets/animations/0.json",
    "assets/animations/1.json",
    "assets/animations/4.json",
  ];

  List<String> pageViewSubTitle = [
    "Welcome To Your Second Home",
    "Welcome To Your Second HomeWelcome To Your Second HomeWelcomeme To Your Second Home",
    "Welcome To Your Second Home",
  ];
}
