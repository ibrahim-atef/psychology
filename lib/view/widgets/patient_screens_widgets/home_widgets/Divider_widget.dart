import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: black,
      indent: 50,
      endIndent: 50,
      thickness: 0.5,
    );
  }
}
