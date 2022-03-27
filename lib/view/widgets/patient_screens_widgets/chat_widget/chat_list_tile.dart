import 'package:flutter/material.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/chat_widget/chat_room_list_tile.dart';

class ChatListViewChatRoomsList extends StatelessWidget {
  const ChatListViewChatRoomsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ChatRoomListTil();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
