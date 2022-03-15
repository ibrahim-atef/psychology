import 'package:flutter/material.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
            child: Divider(
              color: Colors.black54,
              endIndent: 5,
              thickness: .5,
            )),
        Text(
          "Or continue with",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 14.5,
              fontWeight: FontWeight.w700),
        ),
        Expanded(
            child: Divider(
              color: Colors.black54,
              indent: 5,
              thickness: .5,
            )),
      ],
    );
  }
}
