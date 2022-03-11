import 'package:flutter/material.dart';
class AuthButtom extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;

  const AuthButtom({Key? key, required this.onPressed, required this.text, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        height: height * .06,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xffcc6213),
          //     Color(0xffba0b08),
          //     Color(0xff931c04),
          //     Color(0xff3f0303),
          //   ],
          // ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
