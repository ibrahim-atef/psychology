class Call {
  String callerId;
  String callerName;
  String callerPic;
  String receiverId;
  String receiverName;
  String receiverPic;
  String channelId;
  bool isAudioCall;
  bool? hasDialled;

  Call({
    required this.callerId,
    required this.callerName,
    required this.callerPic,
    required this.receiverId,
    required this.receiverName,
    required this.receiverPic,
    required this.channelId,
    required this.isAudioCall,
      this.hasDialled,
  });

  // to map
  Map<String, dynamic> toMap(Call call) {
    Map<String, dynamic> callMap = Map();
    callMap["caller_id"] = call.callerId;
    callMap["caller_name"] = call.callerName;
    callMap["caller_pic"] = call.callerPic;
    callMap["receiver_id"] = call.receiverId;
    callMap["receiver_name"] = call.receiverName;
    callMap["receiver_pic"] = call.receiverPic;
    callMap["channel_id"] = call.channelId;
    callMap["isAudioCall"] = call.isAudioCall;
    callMap["has_dialled"] = call.hasDialled;
    return callMap;
  }

  factory Call.fromMap(map) {
    return Call(
      callerId: map['caller_id'],
      callerName: map['caller_name'],
      callerPic: map['caller_pic'],
      receiverId: map['receiver_id'],
      receiverName: map['receiver_name'],
      receiverPic: map['receiver_pic'],
      channelId: map['channel_id'],
      isAudioCall: map['isAudioCall'],
      hasDialled: map['has_dialled'],
    );
  }
}
