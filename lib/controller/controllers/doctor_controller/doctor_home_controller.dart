import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psychology/services/firestorage_methods.dart';
import 'package:psychology/utils/my_string.dart';

class DoctorHomeController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? blogImage;
  RxBool isLoading = false.obs;
  final GetStorage authBox = GetStorage();

  getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      blogImage = File(pickedFile.path);

      update();
    } else {
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "No Item Selected",
        backgroundColor: Colors.red,
      );
      print("No Image Selected");
    }

    update();
  }

  clearImage() {
    blogImage = null;

    update();
  }

  Future uploadingNewBlog(String body, title,  ) async {
    if (blogImage != null) {
      isLoading.value = true;
      update();
      String userUid = authBox.read(KUid);
     await FireStorageMethods()
          .uploadBlogFile(
        file: blogImage!,
        blogOwnerId: userUid,
        body: body,
        title: title,
        date: DateTime.now(),
      )
          .then((value) {
        isLoading.value = false;      update();

        Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "Blog Uploaded successfully",
          backgroundColor: Colors.green,
        );
        clearImage();
        Get.back();
        update();
      }).catchError((onError) {
        isLoading.value = false;

        debugPrint(onError.toString());
        clearImage();
        Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "$onError",
          backgroundColor: Colors.red,
        );
        update();
      });
    }




  }
}
