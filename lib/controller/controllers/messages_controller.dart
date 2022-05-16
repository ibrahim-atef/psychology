import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
 import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psychology/model/message_model.dart';

 import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:psychology/services/fcm_api_handler.dart';
import 'package:psychology/services/firestorage_methods.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:random_string/random_string.dart';

import '../../utils/my_string.dart';

class MessagesController extends GetxController {
  var messagesList = <MessageModel>[].obs;
  final ImagePicker picker = ImagePicker();

  File? image;
  File? audioFile;
  File? video;
  final recorder = FlutterSoundRecorder();

  Codec _codec = Codec.aacMP4;
  bool isRecorderReady = false;
  RxBool isRecording = false.obs;
  RxBool isSending = false.obs;

  /////////////////////////////////////// Play audio  //////////////////

  /////////////////////////////////////// get audio record //////////////////

  Future record() async {
    if (!isRecorderReady) {
      final status = await Permission.microphone.request();
      Permission.storage.request();
      Permission.manageExternalStorage.request();
      if (status != PermissionStatus.granted) {
        throw Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "Microphone permission not granted",
          backgroundColor: Colors.red,
        );
      }
    }

    await recorder
        .startRecorder(
      toFile: '${randomAlphaNumeric(12)}.mp4',
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      isRecording.value = true;
    });
  }

  Future deleteRecord() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    recorder.deleteRecord(fileName: path.toString());
    recorder.closeRecorder();
    isRecording.value = false;

    recorder.dispositionStream();
  }

  Future sendRecord(
    chatRoomId,
    sendClicked,
    myUserId,
    senderName,
  ) async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    isRecording.value = false;
    audioFile = File(path!);
    if (path != null) {
      try {
        isSending.value = true;
        FireStorageMethods()
            .uploadFile(
          audioFile!,
          "audio",
          chatRoomId,
          sendClicked,
          myUserId,
          senderName,
        )
            .then((value) {
          isSending.value = false;
          Fluttertoast.showToast(
              gravity: ToastGravity.TOP,
              msg: "voice Record sent successfully",
              backgroundColor: Colors.green);
        }).catchError((e) {
          isSending.value = false;
          Fluttertoast.showToast(
            gravity: ToastGravity.TOP,
            msg: "$e",
            backgroundColor: Colors.red,
          );
        });
      } catch (e) {
        isSending.value = false;
      }
    } else {
      print("No Audio Selected");
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "No Audio Selected",
        backgroundColor: Colors.red,
      );

      // User canceled the picker
    }
    print(audioFile!.path);
  }

  Future initRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await recorder.openRecorder();

    if (!await recorder.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      if (!await recorder.isEncoderSupported(_codec) && kIsWeb) {
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
    isRecorderReady = true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.onInit();
    initRecorder();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isRecorderReady = false;
    recorder.closeRecorder();
  }

  //////////////////////////// get audio//////////////////
  // getAudio(chatRoomId, sendClicked, myUserId, senderName) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.audio,
  //   );
  //
  //   if (result != null) {
  //     try {
  //       audio = File(result.files.single.path!);
  //       FireStorageMethods()
  //           .uploadFile(
  //               audio!, "audio", chatRoomId, sendClicked, myUserId, senderName)
  //           .then((value) {
  //         Fluttertoast.showToast(
  //             gravity: ToastGravity.TOP,
  //             msg: "audio sent successfully",
  //             backgroundColor: Colors.green);
  //         update();
  //       }).catchError((e) {
  //         Fluttertoast.showToast(
  //           gravity: ToastGravity.TOP,
  //           msg: "$e",
  //           backgroundColor: Colors.red,
  //         );
  //       });
  //
  //       update();
  //     } catch (e) {}
  //   } else {
  //     print("No Audio Selected");
  //     Fluttertoast.showToast(
  //       gravity: ToastGravity.TOP,
  //       msg: "No Audio Selected",
  //       backgroundColor: Colors.red,
  //     );
  //     update();
  //     // User canceled the picker
  //   }
  // }

  //////////////////////////// get video//////////////////
  Future getVideo(
    chatRoomId,
    sendClicked,
    myUserId,
    senderName,
  ) async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        video = await File(pickedFile.path);
        Get.back();        Fluttertoast.showToast(
            gravity: ToastGravity.TOP,
            msg: "video Picked successfully",
            backgroundColor: Colors.green);
        isSending.value = true;
        FireStorageMethods()
            .uploadFile(
          video!,
          "video",
          chatRoomId,
          sendClicked,
          myUserId,
          senderName,
        )
            .then((value) {
          isSending.value = false;
          Fluttertoast.showToast(
              gravity: ToastGravity.TOP,
              msg: "video sent successfully",
              backgroundColor: Colors.green);
          update();
        });
      } catch (e) {
        isSending.value = false;
        Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "$e",
          backgroundColor: Colors.red,
        );
      }
    } else {
      print("No Video Selected");
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "No Video Selected",
        backgroundColor: Colors.red,
      );
    }
  }

  ////////////////////////////////////// get image/////////////////////////
  getImage(
    chatRoomId,
    sendClicked,
    myUserId,
    senderName,
  ) async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (pickedImage != null) {
      try {
        image = await File(
          pickedImage.path,
        );
        Fluttertoast.showToast(
            gravity: ToastGravity.TOP,
            msg: "image Picked successfully",
            backgroundColor: Colors.green);
        // Get.back();
        isSending.value = true;
        FireStorageMethods()
            .uploadFile(
          image!,
          "image",
          chatRoomId,
          sendClicked,
          myUserId,
          senderName,
        )
            .then((value) {
          isSending.value = false;
          Fluttertoast.showToast(
              gravity: ToastGravity.TOP,
              msg: "Image sent successfully",
              backgroundColor: Colors.green);
          update();
        }).catchError((onError) {
          Fluttertoast.showToast(
              gravity: ToastGravity.TOP,
              msg: "${onError}",
              backgroundColor: Colors.red);
        });
      } catch (e) {
        isSending.value = false;
        Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "$e",
          backgroundColor: Colors.red,
        );
      }
    } else {
      print("No Image Selected");
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "No Item Selected",
        backgroundColor: Colors.red,
      );
    }
  }

  //////////////////////////////send messages////////////////

  sendMessage({
    required String chatRoomId,
    required String friendToken,
    required bool sendClicked,
    required TextEditingController messageTextController,
    required myUserId,
    required senderName,
    required senderImage,
  }) async {
    if (messageTextController.text != "") {
      String message = messageTextController.text;
      messageTextController.clear();
      var lastMessageTs = DateTime.now();

//messageId
      String messageId = "";

      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }
      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "messageId": messageId,
        "senderId": myUserId,
        "senderName": senderName,
        "ts": lastMessageTs,
      };
      isSending.value = true;
      FireStoreMethods()
          .addMessage(chatRoomId, messageId, messageInfoMap)
          .then((value) async {
        isSending.value = false;
        messageTextController.clear();
        isWriting.value = false;
        await FcmHandler.sendMessageNotification(
          friendToken,
          message,
          senderName,
          senderImage,
        );
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageSendTs": lastMessageTs,
          "lastMessageSenderUid": myUserId
        };

        messageTextController.clear();
        isWriting.value = false;
        update();
        FireStoreMethods()
            .updateLastMessageSend(chatRoomId, lastMessageInfoMap);

        if (sendClicked) {
          //  SystemChannels.textInput.invokeMethod('TextInput.hide');
          messageTextController.text = "";
          messageTextController.clear();
          isWriting.value = false;

          messageId = "";
        }
      }).catchError((onError) {
        isSending.value = false;
        Fluttertoast.showToast(
            gravity: ToastGravity.TOP,
            msg: "${onError}",
            backgroundColor: Colors.red);
      });
    }
  }

  //////////////////////////////send File messages////////////////

  sendFileMessage(
      {required String chatRoomId,
      required bool sendClicked,
      required String fileMessage,
      required myUserId,
      required senderName}) {
    if (fileMessage != "") {
      String message = fileMessage;
      var lastMessageTs = DateTime.now();

//messageId
      String messageId = "";

      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }

      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "senderId": myUserId,
        "senderName": senderName,
        "messageId": messageId,
        "ts": lastMessageTs,
      };
      isSending.value = true;
      FireStoreMethods()
          .addMessage(chatRoomId, messageId, messageInfoMap)
          .then((value) async {
        isSending.value = false;
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageSendTs": lastMessageTs,
          "lastMessageSenderUid": myUserId
        };
        FireStoreMethods()
            .updateLastMessageSend(chatRoomId, lastMessageInfoMap);
        update();
        if (sendClicked) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          fileMessage = "";
          //

          messageId = "";
          update();
        }
      }).catchError((onError) {isSending.value=false;
        Fluttertoast.showToast(
            gravity: ToastGravity.TOP,
            msg: "${onError}",
            backgroundColor: Colors.red);
      });
    }
  }

////////////////////////////////////get messages//////////////////////////////
  getMessages(chatRoomId) {
    FireStoreMethods()
        .chatRooms
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("ts", descending: true)
        .snapshots()
        .listen((event) {
      messagesList.clear();
      for (int i = 0; i < event.docs.length; i++) {
        messagesList.add(MessageModel.fromJson(event.docs[i]));
      }
    });
  }

  ////////////////////////////////////deleteMessage//////////////////////////////
  deleteMessage(
    String chatRoomId,
    Map<String, dynamic> lastMessageInfoMap,
    messageId,
  ) {
    FireStoreMethods().deleteMessage(chatRoomId, messageId).then((value) {
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "Deleted successfully",
          backgroundColor: Colors.red.shade400);
      FireStoreMethods().updateLastMessageSend(chatRoomId, lastMessageInfoMap);
    }).catchError((onError){        Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "${onError}",
        backgroundColor: Colors.red);});
  }

  ////////////////////////////////////

  RxBool isWriting = false.obs;

  isWritingFun(val) {
    if (val != "" && val != null) {
      isWriting.value = true;
    } else {
      isWriting.value = false;
    }
  }
}
