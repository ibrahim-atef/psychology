
import 'package:flutter/material.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/chat_widget/chat_room_list_tile.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ChatRoomListTil();
          },
          separatorBuilder: (context, index) {return SizedBox(height: 10,);},
          itemCount: 10),
    );
  }
}
