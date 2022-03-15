import 'package:flutter/material.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class UploadFileDoctor extends StatelessWidget {
  final Function() onPressed;

  const UploadFileDoctor({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        KTextUtils(
            text: "Identity photo",
            size: 15,
            color: white,
            fontWeight: FontWeight.w400,
            textDecoration: TextDecoration.none),
        InkWell(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: width * .3,
            height: height * .046,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 1.3,
              ),
            ),
            child: KTextUtils(
                text: "Upload file",
                size: 16,
                color: white,
                fontWeight: FontWeight.w700,
                textDecoration: TextDecoration.none),
          ),
        )
      ],
    );
  }
}
