import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class HomeScreenDoctorContainerBocking extends StatelessWidget {
  String name;
  String description;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * 13,
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            ClipRRect(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(
                            imageUrl,
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                KTextUtils(
                    text: name,
                    size: 18,
                    color: black,
                    fontWeight: FontWeight.w700,
                    textDecoration: TextDecoration.none),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: SizeConfig.defaultSize! * 4.5,
                  child: KTextUtils(
                      text: description,
                        size: 10,
                      color: grey,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.none),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                SizedBox(
                  width: SizeConfig.defaultSize! * 4.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildIcon(),
                      buildIcon(),
                      buildIcon(),
                      buildIcon(),
                      buildIcon(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: SizeConfig.defaultSize! * 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KTextUtils(
                          text: " \$ 200EGP",
                          size: SizeConfig.defaultSize! * 0.58,
                          color: black,
                          fontWeight: FontWeight.w600,
                          textDecoration: TextDecoration.none),
                      Spacer(),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 1.2,
                        width: SizeConfig.defaultSize! * 4.2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0),
                              primary: mainColor2, // background
                            ),
                            onPressed: () {},
                            child: KTextUtils(
                                text: "Bock Now",
                                size: SizeConfig.defaultSize! * .7,
                                color: white,
                                fontWeight: FontWeight.w800,
                                textDecoration: TextDecoration.none)),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Icon buildIcon() {
    return Icon(
      Icons.star,
      color: Colors.orangeAccent,
      size: 12,
    );
  }

  HomeScreenDoctorContainerBocking({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}
