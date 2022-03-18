import 'package:flutter/material.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class OnlineDoctorsStackWidget extends StatelessWidget {
  const OnlineDoctorsStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              height: SizeConfig.defaultSize! * 9,
              width: SizeConfig.defaultSize! * 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                  )),
            ),
          ),
        ),
        Positioned(
          bottom: 3,
          right: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black26),
            height: SizeConfig.defaultSize! * 4,
            width: SizeConfig.defaultSize! * 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KTextUtils(
                  text: "ibrahim atef",
                  size: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  textDecoration: TextDecoration.none,
                ),
                KTextUtils(
                  text: "ibrahim atef ibrahim atef ibrahim atef brahim atef",
                  size: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  textDecoration: TextDecoration.none,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
