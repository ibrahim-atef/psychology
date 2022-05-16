import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
   final String message;
   final String messageId;
  final String senderId;
  final String senderName;
  final Timestamp ts;

  MessageModel(
     this.message,
     this.messageId,
    this.senderId,
    this.senderName,
    this.ts,
  );

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
       jsonData["message"],
       jsonData["messageId"],
      jsonData["senderId"],
      jsonData["senderName"],
      jsonData["ts"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
       'message': this.message,
      'senderId': this.senderId,
      'senderName': this.senderName,
      'ts': this.ts,
    };
  }


}
