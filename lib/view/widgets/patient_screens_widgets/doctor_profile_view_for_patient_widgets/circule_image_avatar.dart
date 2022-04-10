import 'dart:io';

import 'package:flutter/material.dart';
import 'package:psychology/utils/constants.dart';

class CirculeImageAvatar extends StatelessWidget {
  String imageUrl;
  double width;
  Color? color;
  File? image;

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
        borderRadius: BorderRadius.circular(width * 2),
        border: Border.all(
          color: color ?? mainColor2,
          width: 1.3,
        ),
      ),
      child: Card(
        margin: EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 2)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(width * 2),
          child: image == null
              ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                )
              : Image.file(image!),
        ),
      ),
    );
  }

  CirculeImageAvatar(
      {required this.imageUrl, required this.width, this.color, this.image});
}
