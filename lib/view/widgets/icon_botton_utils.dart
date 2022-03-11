import 'package:flutter/material.dart';

class KIconButtom extends StatelessWidget {

  IconData icon;
  Color color;
  double size;
  Function function;


  @override
  Widget build(BuildContext context) {
    return  IconButton(
        onPressed: ()=>function,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ));
  }

  KIconButtom({
    required this.icon,
    required this.color,
    required this.size,
    required this.function,
  });
}
