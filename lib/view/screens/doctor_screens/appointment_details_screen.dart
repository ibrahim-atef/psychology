import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/model/appointment_model.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/styles.dart';
import 'package:psychology/view/widgets/utils_widgets/text_utils.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  AppointmentModel appointmentModel = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f4fe),
      appBar: AppBar(
        title: KTextUtils(
            text: "Details",
            size: 20,
            color: mainColor3,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("${appointmentModel.patientImage}"),
              radius: 70,
            ),
            const Spacer(
              flex: 1,
            ),
            Card(
              color: Color(0xfff3f6ff),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Name : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          "${appointmentModel.patientName}",
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor2,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Date  : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          "${appointmentModel.dayDate}",
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor2,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Start : ",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "${appointmentModel.startTime}",
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor2,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("End : ",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "${appointmentModel.endTime}",
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor2,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Price : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          "${appointmentModel.price}  EGP",
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor2,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              width: Get.width * .5,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Message",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      IconBroken.Chat,
                      size: 25,
                      color: mainColor2,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
