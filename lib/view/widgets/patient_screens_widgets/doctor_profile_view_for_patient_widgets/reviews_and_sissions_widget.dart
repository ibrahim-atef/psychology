import 'package:flutter/material.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class ReviewsAndSissions extends StatelessWidget {
  const ReviewsAndSissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Expanded(flex: 1,
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/dollar.png"),
                KTextUtils(
                    text: "200 EGP",
                    size: 15,
                    color: black,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.none)
              ],
            )),
            Expanded(flex: 1,
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_purple500_sharp, color: Colors.orangeAccent),
                KTextUtils(
                    text: "4.5",
                    size: 15,
                    color: black,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.none)
              ],
            )),
            Expanded(flex: 1,
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow_rounded, color: mainColor),
                KTextUtils(
                    text: "+1000",
                    size: 15,
                    color: black,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.none),
                KTextUtils(
                    text: " Sessions",
                    size: 13,
                    color: grey,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.none)
              ],
            )),
          ],
        ),
      ),
    );
  }
}
