import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';

class GenderWidget extends StatelessWidget {
  GenderWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: width * .3,
              height: height * .046,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 1.3,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 25,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            "male",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: "male",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "female",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: "female",
                        ),
                      ],
                      onChanged: (value) {
                        controller.patientGender.value = value!;
                        // gender=value;
                        // print(gender);
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Obx(
                            (){return Text(
                              controller.patientGender.value == ""
                                  ? "gender"
                                  : controller.patientGender.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );}
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
