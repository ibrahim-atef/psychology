import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';


class ProfileImagePicking extends StatelessWidget {

  ProfileImagePicking({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: width * .25,
                      width: width * .25,
                      child: controller.profileImage == null
                          ? Image.asset("assets/images/profile.png")
                          : Image.file(
                              controller.profileImage!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        controller.getImage();
                      },
                      icon:Icon (Icons.add_a_photo_outlined,color: Colors.black54,),
                      label: Text("pick an image",style: TextStyle(color: Colors.black54),),
                    )

                    // IconButton(
                    //   onPressed: () {
                    //     controller.getImage();
                    //   },
                    //   icon: Icon(
                    //     Icons.add_a_photo_outlined,
                    //     color: white,
                    //   ),
                    // ),
                    // Text("pick an image"),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
