 import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/view/widgets/utils_widgets/image_viewer.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../../../../utils/constants.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.isAudio,
    required this.isImage,
    required this.isVideo,
    //  required this.messageId,
  }) : super(key: key);
  String message;
  bool isMe;
  bool isAudio;
  bool isImage;
  bool isVideo;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: isMe
              ? BorderRadius.only(
                  topRight: Radius.circular(17),
                  bottomLeft: Radius.circular(17),
                  topLeft: Radius.circular(17))
              : BorderRadius.only(
                  topRight: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                  topLeft: Radius.circular(17)),
          color: isMe ? mainColor2 : mainColor4,
        ),
        child: isImage
            ? InkWell(
                onTap: () {
                  Get.to(
                      () => ImageViewer(
                            imageUrl: message,
                          ),
                      transition: Transition.fadeIn,
                      duration: Duration(milliseconds: 200));
                },
                child: SizedBox(
                    height: Get.width * .6,
                    width: Get.width * .7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/l.gif",
                          image: message),
                    )),
              )
            : isVideo
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: BetterPlayer.network(
                      message,
                      betterPlayerConfiguration:
                          const BetterPlayerConfiguration(
                              showPlaceholderUntilPlay: true,
                              fit: BoxFit.contain,
                              autoDetectFullscreenAspectRatio: true,
                              autoDetectFullscreenDeviceOrientation: true,
                              expandToFill: false,
                              fullScreenByDefault: false),
                    ),
                  )
                : isAudio
                    ? VoiceMessage(
                        audioSrc: message,
                        me: isMe,
                        contactFgColor: white,
                        contactPlayIconColor: mainColor4,mePlayIconColor: mainColor2,
                        contactBgColor: mainColor4,
                        meBgColor: mainColor2,
                      )
                    // AudioPlay(message: message, isMe: isMe)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${message}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
      ),
    );
  }
}
