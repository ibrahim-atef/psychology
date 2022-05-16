import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomModel{
  String lastMessage;
  String chatRoomId;
  String lastMessageSenderUid;
  Timestamp lastMessageSendTs;
  List chatRoomUsers;

  ChatRoomModel(
   this.lastMessage,
   this.chatRoomId,
   this.lastMessageSenderUid,
   this.lastMessageSendTs,
   this.chatRoomUsers,
  );

  Map<String, dynamic> toMap() {
    return {
      'lastMessage': this.lastMessage,
      'lastMessageSenderUid': this.lastMessageSenderUid,
      'lastMessageSendTs': this.lastMessageSendTs,
      'chatRoomUsers': this.chatRoomUsers,
    };
  }

  factory ChatRoomModel.fromMap( map) {
    return ChatRoomModel(
       map['lastMessage'] ,
       map['chatRoomId'] ,
       map['lastMessageSenderUid'] ,
       map['lastMessageSendTs']  ,
       map['chatRoomUsers'] ,
    );
  }

}