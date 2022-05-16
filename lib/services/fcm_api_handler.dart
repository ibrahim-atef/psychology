import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/my_string.dart';



class FcmHandler {





  static Future sendMessageNotification(
    String token,
    messageBody,
    messageSender,senderImageUrl
  ) async {
    Map data = {
      "to": "$token",
      "notification": {
        "title": "$messageSender",
        "body": "$messageBody",
        "imageUrl":"$senderImageUrl",
        "sound": "default"
      },
      "android": {
        "notification_priority": "PRIORITY_MAX",
        "priority": "high",
        "notification": {
          "sound": "default",
          "defaultSound": true,
          "default_vibrate_timings": true,
          "default_light_settings": true,
          "vibrate":true

        }
      },
      "data": {
        "type": "order",
        "id": "87",
        "click_action": "FLUTTER_NOTIFICATION_CLICK"
      }
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(fcmBaseUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "key=$cloudMessagingKey"
        },
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
}
