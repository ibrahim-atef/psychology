import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';

class CirculeImageAvatar extends StatelessWidget {
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(padding: EdgeInsets.zero,alignment: Alignment.topLeft,
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: black,
                  size: 30,
                )),
          ],
        ),
        SizedBox(width: SizeConfig.defaultSize!*7.2,),
        Container(
          height: SizeConfig.defaultSize! * 4.8,
          width: SizeConfig.defaultSize! * 4.8,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: NetworkImage(
            //     "$imageUrl",
            //   ),
            // ),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: mainColor2,
              width: 1.3,
            ),
          ),
          child: Card(
            margin: EdgeInsets.all(2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(imageUrl),
            ),
          ),
        ),
      ],
    );
  }

  CirculeImageAvatar({
    required this.imageUrl,
  });
}
