import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/chat_rooms_controller.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_main_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/chat_widget/chat_room_list_tile.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class DoctorChatScreen extends StatelessWidget {
  // final chatRoomController = Get.put(ChatRoomsController());
  // final mainController = Get.put(MainDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leadingWidth: 0,
        leading: SizedBox(
          width: 0,
        ),
        backgroundColor: mainColor2,
        title: KTextUtils(
            text: "Messages",
            size: 25,
            color: white,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none),
      ),

      // body: chatRoomController.chatRoomsList.length != 0
      //     ? ListView.separated(
      //         padding: EdgeInsets.zero,
      //         physics: BouncingScrollPhysics(),
      //         shrinkWrap: true,
      //         itemBuilder: (context, index) {
      //           return AnimationConfiguration.staggeredList(
      //             position: index,
      //             duration: const Duration(milliseconds: 1000),
      //             child: SlideAnimation(
      //               horizontalOffset: 300,
      //               child: FadeInAnimation(
      //                 child: ChatRoomListTil(
      //                   chatRoomId:
      //                       chatRoomController.chatRoomsList[index].chatRoomId,
      //                   myUid: mainController.myData.value!.uid!,
      //                   index: index,
      //                   myData: mainController.myData.value!,
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //         separatorBuilder: (context, i) {
      //           return SizedBox(
      //             height: Get.height * .004,
      //           );
      //         },
      //         itemCount: chatRoomController.chatRoomsList.length)
      //     : Center(
      //         child: KTextUtils(
      //             text: "You don't have any conversations",
      //             size: 22,
      //             color: mainColor4,
      //             fontWeight: FontWeight.bold,
      //             textDecoration: TextDecoration.none),
      //       ),
    );
  }
}
