import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class UserImageAndName extends StatelessWidget {
  const UserImageAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
              child: Container(
                height: SizeConfig.defaultSize! * 4,
                width: SizeConfig.defaultSize! * 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(
                      color: mainColor2,
                      width: 1.3,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                    )),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.defaultSize,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KTextUtils(
                  text: "Hello,",
                  size: 18,
                  color: darkGrey,
                  fontWeight: FontWeight.w500,
                  textDecoration: TextDecoration.none),
              KTextUtils(
                  text: "Ibrahim Atef Ibrahim",
                  size: 22,
                  color: darkGrey,
                  fontWeight: FontWeight.w600,
                  textDecoration: TextDecoration.none),
            ],
          )
        ],
      ),
    );
  }
}
