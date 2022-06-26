import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:psychology/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    Future.delayed(const Duration(milliseconds: 3750), () {
      Get.toNamed(Routes.OnBoardingScreen);
    });
    super.onInit();
  }

////////////////////////////////////onBoarding logic////////////////////////////////////onBoarding logic
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
    "Welcome to Psychology",
    "Find a Doctor",
    "Make Video call",
  ];
}
