import 'package:flutter/cupertino.dart';

class HeightSizeBox extends StatelessWidget {
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }

  HeightSizeBox(
      this.height,
  );
}

class WidthtSizeBox extends StatelessWidget {
  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }

  WidthtSizeBox({
    required this.width,
  });
}
