import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:psychology/controller/controllers/chat_rooms_controller.dart';
import 'package:psychology/model/doctor_info_model.dart';
import 'package:psychology/model/patint_info_model.dart';
 import 'package:psychology/routes/routes.dart';
import 'package:psychology/utils/constants.dart';

class ChatRoomListTil extends StatelessWidget {
  String chatRoomId;
  int index;

  UserModel myData;
  String lastMessage = "";

  final cc = Get.put(ChatRoomsController());

  @override
  Widget build(BuildContext context) {
    // cc.getFriendDataByUid(chatRoomId);
    return GetX(
        init: cc,
        initState: cc.getFriendDataByUid(chatRoomId),
        builder: (ChatRoomsController chatRoomsController) {
          cc.chatRoomsList[index].lastMessage.contains("image%2")
              ? lastMessage = "image"
              : cc.chatRoomsList[index].lastMessage.contains("audio%2")
              ? lastMessage = "voice record"
              : cc.chatRoomsList[index].lastMessage.contains("video%2")
              ? lastMessage = "video"
              : lastMessage = cc.chatRoomsList[index].lastMessage;
          try {
            return InkWell(
              onLongPress: () {
                Get.defaultDialog(
                    onConfirm: () {
                      Get.back();
                    },
                    onCancel: () {
                      cc.deleteChatRoom(chatRoomId);
                    },
                    title: "Delete chat",
                    textConfirm: "No",
                    middleText: "Are you sure to Delete chat...!",
                    confirmTextColor: Colors.white,
                    textCancel: "Yes",
                    buttonColor: mainColor2,
                    cancelTextColor: mainColor2,
                    backgroundColor: white);
              },
              onTap: () {
                Get.toNamed(Routes.chatScreen, arguments: [
                  cc.friendInfoModel[index],
                  chatRoomId,
                  cc.myUid,
                  myData,
                ]);
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: Get.width * .2,
                      width: Get.width * .2,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/images/l.gif",
                            image: "${cc.friendInfoModel[index].profileUrl}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .04,
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cc.friendInfoModel[index].displayName}",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${lastMessage}",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black54),
                              maxLines: 2,
                            ),
                          ],
                        )),
                    SizedBox(
                      width: Get.width * .1,
                    ),
                    Container(
                      child: Text(
                        "${DateFormat.jm().format(cc.chatRoomsList[index].lastMessageSendTs.toDate())}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } catch (e) {
            return SizedBox();
          }
        });
  }

  ChatRoomListTil({
    required this.chatRoomId,
    required this.index,
    required this.myData,

  });
}
