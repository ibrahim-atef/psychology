import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_home_controller.dart';
import 'package:psychology/model/patint_info_model.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/styles.dart';

class AggBlogScreen extends StatelessWidget {
  TextEditingController addBlogTextController = TextEditingController();
  final doctorHomeController = Get.find<DoctorHomeController>();
UserModel userModel=Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(elevation: 1,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Post",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: homeBackGroundColor),
              ))
        ],
        leading: IconButton(
          onPressed: () {Get.back();},
          icon: Icon(IconBroken.Arrow___Left_2),
        ),
        backgroundColor: mainColor2,
        title: const Text("Create Blog"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   LinearProgressIndicator(),

              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: addBlogTextController,
                decoration: InputDecoration(
                  hintText: "What is in your mind ...",
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // false?
              //   Stack(
              //     alignment: AlignmentDirectional.topEnd,
              //     children: [
              //       Align(
              //         alignment: AlignmentDirectional.bottomCenter,
              //         child: Container(
              //           width: double.infinity,
              //           decoration: BoxDecoration(
              //             color: Theme.of(context).scaffoldBackgroundColor,
              //             borderRadius: BorderRadius.circular(10),
              //             boxShadow: [
              //               BoxShadow(
              //                   color: Colors.grey.withOpacity(0.4),
              //                   blurRadius: 9,
              //                   spreadRadius: 4,
              //                   offset: Offset(0, 4))
              //             ],
              //           ),
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(10),
              //             child: Image(
              //                 image: FileImage(
              //                     SocialAppCubit.get(context).PostImage!),
              //                 fit: BoxFit.contain),
              //           ),
              //         ),
              //       ),
              //       IconButton(
              //           onPressed: () {
              //             SocialAppCubit.get(context).removePostImage();
              //           },
              //           icon: Container(
              //             decoration:
              //                 BoxDecoration(shape: BoxShape.circle, boxShadow: [
              //               BoxShadow(
              //                   color: Colors.grey.withOpacity(0.4),
              //                   blurRadius: 9,
              //                   spreadRadius: 4,
              //                   offset: Offset(0, 4))
              //             ]),
              //             child: CircleAvatar(
              //                 backgroundColor:
              //                     Theme.of(context).scaffoldBackgroundColor,
              //                 child: Icon(
              //                   Icons.close_rounded,
              //                   color: social3,
              //                 )),
              //           ))
              //     ],
              //   ),
              // SizedBox(
              //   height: 20,
              // ),
              // if (SocialAppCubit.get(context).PostImage == null)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.63,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.4))),
                  child: MaterialButton(
                      onPressed: () {
                        //   SocialAppCubit.get(context).getPostImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: mainColor2,
                          ),
                          Text(
                            " add photos",
                            style: TextStyle(
                                color: mainColor2,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              )
              // Stack(
              //   alignment: AlignmentDirectional.topEnd,
              //   children: [
              //     Container(
              //       height: 150,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(4),
              //         image: DecorationImage(
              //           image: FileImage(
              //               SocialAppCubit.get(context).postImage!),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),
              //     CircleAvatar(
              //       backgroundColor: Colors.black45,
              //       radius: 18,
              //       child: IconButton(
              //         onPressed: () {
              //           SocialAppCubit.get(context).removePostImage();
              //         },
              //         icon: Icon(
              //           Icons.close,
              //           size: 20,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 30),
              // Row(
              //   children: [
              //     Expanded(
              //       child: TextButton.icon(
              //         onPressed: () {
              //           SocialAppCubit.get(context).getPostImage();
              //         },
              //         icon: Icon(IconBroken.Image),
              //         label: Text("add photo"),
              //       ),
              //     ),
              //     Expanded(
              //       child: TextButton(
              //         onPressed: () {},
              //         child: Text("# tags"),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
