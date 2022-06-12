import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:psychology/model/appointment_model.dart';
import 'package:psychology/services/firestorage_methods.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/my_string.dart';

class DoctorHomeController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? blogImage;
  RxBool isLoading = false.obs;
  bool isAddingAppointment = false;
  DateTime currentDateTime = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, 0, 0, 0, 0000);
  String from = DateFormat('hh:mm a').format(DateTime.now());
  String to =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 30)));
  final GetStorage authBox = GetStorage();
  int currentPAgeViewIndex = 0;
  String? myUid;
  var appointmentsList = <AppointmentModel>[].obs;
  var currentDayAppointmentsList = <AppointmentModel>[].obs;

  /// initState
  void onInit() {
    getMyAppointments();
    super.onInit();
  }

  ///  add blog details ///
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

  Future uploadingNewBlog(
    String body,
    title,
  ) async {
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
        isLoading.value = false;
        update();

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

  ///home screen details
  changeSelectedDateTime(DateTime dateTime) {
    currentDateTime = dateTime;

    update();
  }

  ///add appointment details.
  changeSelectedStartTime(String dateTime) {
    from = dateTime;

    update();
  }

  changeSelectedEndTime(String dateTime) {
    to = dateTime;

    update();
  }

  Future addAppointment({
    required String dayDate,
    required bool isTaken,
    required String patientName,
    required String patientImage,
    required String patientId,
    required String patientToken,
    required String startTime,
    required String endTime,
    required String price,
  }) async {
    isAddingAppointment = true;
    update();
    AppointmentModel appointmentModel = AppointmentModel(
        dayDate: dayDate,
        appointmentCreationDate: DateTime.now(),
        isTaken: isTaken,
        patientName: patientName,
        patientImage: patientImage,
        patientId: patientId,
        patientToken: patientToken,
        startTime: startTime,
        endTime: endTime,
        price: price);
    String myUid = authBox.read(KUid);
    await FireStoreMethods()
        .doctors
        .doc(myUid)
        .collection(appointmentsCollectionKey)
        .doc("${startTime}-${endTime}-${dayDate}")
        .set(appointmentModel.toMap(appointmentModel))
        .then((value) {
      Get.snackbar("Done", "appointment added Successfully",
          backgroundColor: Colors.green);

      isAddingAppointment = false;

      update();
    }).catchError((onError) {
      Get.snackbar("Error", "$onError", backgroundColor: Colors.red);
      isAddingAppointment = false;
      update();
    });
  }

  ///get my appointments
  getMyAppointments() async {
    String myUid = authBox.read(KUid);
    await FireStoreMethods()
        .doctors
        .doc(myUid)
        .collection(appointmentsCollectionKey)
        .orderBy("appointmentCreationDate", descending: true)
        .snapshots()
        .listen((event) {
      if (event.docs.isNotEmpty) {
        appointmentsList.clear();
        for (int i = 0; i < event.docs.length; i++) {
          appointmentsList.add(AppointmentModel.fromMap(event.docs[i]));
        }
        getSpecificAppointmentsList(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 0, 0, 0, 0000));
        update();
      } else {
        appointmentsList.clear();
        print("You don't have appointments");
      }
      update();
    });
  }

  getSpecificAppointmentsList(DateTime dateTime) {
    currentDayAppointmentsList.clear();
 currentDayAppointmentsList.value=   appointmentsList.where((p0) {
      return p0.dayDate == dateTime.toString();
    }).toList();
  }
}
