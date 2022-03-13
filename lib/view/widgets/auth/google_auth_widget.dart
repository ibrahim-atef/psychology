import 'package:flutter/material.dart';
import 'package:psychology/utils/size_config.dart';

class GoogleAuthImage extends StatelessWidget {
  final Function() onPressed;

  const GoogleAuthImage({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: onPressed,
            child: Container(
              width: SizeConfig.defaultSize! * 1.7,
              height: SizeConfig.defaultSize! * 1.7,
              child: Image.asset(
                "assets/images/google.png",
              ),
            )),
      ],
    );
  }
}
