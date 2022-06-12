import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/chat_rooms_controller.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_main_controller.dart';
import 'package:psychology/controller/controllers/patient_controller/main_patient_controller.dart';
import 'package:psychology/controller/controllers/patient_controller/patient_home_screen_controller.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/chat_widget/chat_room_list_tile.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class ChatListViewChatRoomsList extends StatelessWidget {
  final mainDoctorController = Get.put(MainDoctorController());
  final mainPatientController = Get.put(MainPatientController());
  final chatRoomController = Get.put(ChatRoomsController());
  final patientHomeScreenController = Get.put(PatientHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return chatRoomController.chatRoomsList.isNotEmpty
          ? ListView.separated(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1000),
                  child: SlideAnimation(
                    verticalOffset: 300,
                    child: FadeInAnimation(
                      child: ChatRoomListTil(
                        chatRoomId:
                            chatRoomController.chatRoomsList[index].chatRoomId,
                        index: index,
                        myData: patientHomeScreenController
                                .patientInfoModel.value ??
                            mainDoctorController.myData.value!,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return SizedBox(
                  height: Get.height * .004,
                );
              },
              itemCount: chatRoomController.chatRoomsList.length)
          : Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              height: Get.height * .5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * .3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KTextUtils(
                            text: "You Don't Have Any Conversations",
                            size: Get.width * .038,
                            color: black,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.none),
                      ],
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
