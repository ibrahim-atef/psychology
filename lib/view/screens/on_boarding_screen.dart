import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/splash_controller.dart';
import 'package:psychology/view/widgets/on_boarding_widgets/app_icon_and_name.dart';
import 'package:psychology/view/widgets/on_boarding_widgets/matreal_button.dart';
import 'package:psychology/view/widgets/on_boarding_widgets/page_view_images.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            AppIconAndName(),
            SizedBox(
              height: height * .12,
            ),
            SizedBox(height: height * .33, child: PageViewImages()),
            Spacer(),
            GetBuilder<SplashController>(
              builder: (_) {
                return MatrealBtn(
                    text: (controller.isLast.value == true) ? 'LogIn' : 'Next',
                    onPressed: () async {
                      await controller.pageeController.value.nextPage(
                          duration: Duration(milliseconds: 450),
                          curve: Curves.easeInOut);
                      controller.checkController();
                    },
                    width: width * .7);
              },
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
//code
