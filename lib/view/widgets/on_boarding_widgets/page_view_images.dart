import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:psychology/controller/controllers/splash_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewImages extends StatelessWidget {
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<SplashController>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: Container(height: height*.45,
                child: PageView.builder(
                  onPageChanged: (val) {
                    controller.checkController();
                    val == 2 ? controller.isLast.value = true : false;
                  },
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageeController.value,
                  itemCount: controller.lottieViewList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                            width: width * .7,
                            height: height * .27,
                            child: Lottie.asset(
                              controller.lottieViewList[index],
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height:height*.065,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Text(controller.pageViewSubTitle[index],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                                maxLines: 2),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SmoothPageIndicator(
                controller: controller.pageeController.value,
                // pageeController.value
                count: controller.lottieViewList.length,
                effect: JumpingDotEffect(
                    dotWidth: 9, dotHeight: 9, verticalOffset: 0.0),
                // your preferred effect
                onDotClicked: (index) {},
              ),
            ),
          ],
        );
      },
    );
  }
}
