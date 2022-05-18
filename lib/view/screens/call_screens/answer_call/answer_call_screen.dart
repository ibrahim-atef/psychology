import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import 'package:psychology/controller/controllers/call_controller.dart';
import 'package:psychology/model/call_model.dart';
import 'package:psychology/routes/routes.dart';
import 'package:psychology/services/call_methods.dart';
import 'package:psychology/services/permission_services.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/utils/styles.dart';
import 'package:psychology/view/screens/call_screens/audio_call_screen.dart';
import 'package:psychology/view/screens/call_screens/video_call_screen.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/circule_image_avatar.dart';

import '../../../../utils/constants.dart';

class AnswerCallScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();
  final callController = Get.put(CallController());
  final GetStorage authBox = GetStorage();

  AnswerCallScreen({
    required this.call,
  });

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Scaffold(
      backgroundColor: homeBackGroundColor,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    width: Get.width * .5,
                    height: Get.width * .5,
                    child: LottieBuilder.asset(
                      "assets/images/calling.json",
                      frameRate: FrameRate.max,
                    )),
                CirculeImageAvatar(
                  imageUrl: call.callerPic,
                  width: Get.width * .3,
                ),
              ],
            ),
            Text(
              call.callerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: Get.width * .01),
            Text(
              call.isAudioCall
                  ? "Incoming audio call..."
                  : "Incoming video call...",
              style: TextStyle(
                color: Colors.black54,
                fontSize: Get.width * .05,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: InkWell(
                    onTap: () async {
                      await callMethods.endCall(call: call) ;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Transform.rotate(
                        angle: 3,
                        child: Icon(
                          IconBroken.Call,
                          size: Get.width * .11,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Get.width * .3),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: InkWell(
                    onTap: () async => await Permissions
                                .cameraAndMicrophonePermissionsGranted() &&
                            call.channelId.isNotEmpty
                        ? call.isAudioCall
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AudioCallScreen(call: call),
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoCallScreen(call: call),
                                ),
                              )
                        : {},
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        IconBroken.Call,
                        size: Get.width * .11,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
