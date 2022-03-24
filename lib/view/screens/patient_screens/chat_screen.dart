import 'package:flutter/material.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/size_config.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/chat_widget/chat_list_tile.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/chat_widget/chat_search_widget.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/chat_widget/online_doctors_chat.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class PatientChatScreen extends StatelessWidget {
  const PatientChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.defaultSize,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: SizeConfig.defaultSize! * .9),
            child: KTextUtils(
                text: "Messages",
                size: 25,
                color: black,
                fontWeight: FontWeight.bold,
                textDecoration: TextDecoration.none),
          ),
          SearchWidget(),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: SizeConfig.defaultSize! * .9),
            child: KTextUtils(
                text: "Online",
                size: SizeConfig.defaultSize! * 1.2,
                color: black,
                fontWeight: FontWeight.w800,
                textDecoration: TextDecoration.none),
          ),
          OnlineDoctorsChat(),
          SizedBox(
            height: SizeConfig.defaultSize,
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: SizeConfig.defaultSize! * .8),
            child: KTextUtils(
                text: "Messages",
                size: SizeConfig.defaultSize! * 1.2,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                textDecoration: TextDecoration.none),
          ),
          ChatListTile()


        ],
      ),
    ));
  }
}
