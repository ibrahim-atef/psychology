import 'package:flutter/material.dart';
 import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';

class CirculeImageAvatar extends StatelessWidget {
  String imageUrl;
double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: width,

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
          child: Image.network(imageUrl,fit: BoxFit.cover,),
        ),
      ),
    );
  }

  CirculeImageAvatar({
    required this.imageUrl,
    required this.width,
  });
}
