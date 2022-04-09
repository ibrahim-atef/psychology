import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/splash_controller.dart';
import 'package:psychology/routes/routes.dart';
import 'package:psychology/utils/constants.dart';
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
            AppIconAndName(
              color: Colors.black,
            ),
            GetBuilder<SplashController>(
              builder: (_) {
                return (controller.isLast.value == true)
                    ? SizedBox(
                        height: height * .13,
                      )
                    : Container(
                        alignment: Alignment.centerRight,
                        height: height * .13,
                        child: Container(
                          alignment: Alignment.center,
                          height: height * .03,
                          width: width * .2,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Get.offAllNamed(
                                Routes.loginScreen,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Skip",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: grey),
                                ),
                                Opacity(
                                    opacity: .5,
                                    child:
                                        Image.asset("assets/images/skip.png"))
                              ],
                            ),
                          ),
                        ),
                      );
              },
            ),
            SizedBox(height: height * .43, child: PageViewImages()),
            Spacer(),
            GetBuilder<SplashController>(
              builder: (_) {
                return MatrealBtn(
                    text: (controller.isLast.value == true) ? 'LogIn' : 'Next',
                    onPressed: controller.isLast.value == true
                        ? () async {
                            await controller.pageeController.value.nextPage(
                                duration: Duration(milliseconds: 450),
                                curve: Curves.easeInOut);
                            controller.checkController();
                            Get.offAllNamed(Routes.loginScreen);
                          }
                        : () async {
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
