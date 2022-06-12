import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/model/appointment_model.dart';
import 'package:psychology/model/blogs_model.dart';
import 'package:psychology/model/doctor_info_model.dart';
import 'package:psychology/model/patint_info_model.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/constants.dart';
import 'package:psychology/utils/my_string.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/first_tap_bar_column.dart';
import 'package:psychology/view/widgets/patient_screens_widgets/doctor_profile_view_for_patient_widgets/tap_bar_reviews_widget.dart';

class PatientHomeScreenController extends GetxController {
  RxList doctorsList = [].obs;
  DateTime firstDayDateTime = DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, 0, 0, 0, 0000);
  List<DateTime> daysDateList = [];
  RxList moreDoctorsList = [].obs;
  final patientInfoModel = Rxn<UserModel>();
  RxBool isDeleting = false.obs;
  RxBool isGettingAppointments = false.obs;
  RxList blogsList = [].obs;
  RxList blogsIdList = [].obs;
  var appointmentsList = <AppointmentModel>[].obs;
  List<Widget> tabScreens = [FirstTapBarWidget(), TabBarReviewsWidget()];
  List<Color> colorList = [
    Color(0xffFFD93D),
    mainColor2,
    Color(0xffF190B7),
    yelloo,
    Color(0xff97DBAE),
  ];

  GetStorage authBox = GetStorage();

  @override
  void onInit() async {
    // TODO: implement onInit
    await GetStorage.init();
    getUserData();
    getMoreDoctorsInfo();
    getDoctorsInfo();
    getBlogs();addDaysList();
    super.onInit();
  }

  getDoctorsInfo() async {
    // userStream = await FireStoreMethods().GetUserByUserName(textEditingController.text);
    await FireStoreMethods().doctors.snapshots().listen((event) {
      doctorsList.clear();
      for (int i = 0; i < event.docs.length; i++) {
        doctorsList.add(UserModel.fromMap(event.docs[i]));
      }
    });
    //   update();
  }

  getMoreDoctorsInfo() async {
    await FireStoreMethods().doctors.snapshots().listen((event) {
      moreDoctorsList.clear();
      for (int i = 0; i < event.docs.length; i++) {
        moreDoctorsList.add(UserModel.fromMap(event.docs[i]));
      }
    });
    //  update();
  }

  getUserData() async {
    await FireStoreMethods()
        .patients
        .doc(authBox.read(KUid))
        .snapshots()
        .listen((event) {
      patientInfoModel.value = null;
      if (event.exists) {
        patientInfoModel.value = UserModel.fromMap(event);
      } else {
        Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "user data not found in firebase",
          backgroundColor: mainColor2,
        );
      }
      //  update();
    });
  }

  getBlogs() {
    FireStoreMethods()
        .blogs
        .orderBy(
          "date",
        )
        .snapshots()
        .listen((event) {
      blogsList.clear();
      blogsIdList.clear();
      for (int i = 0; i < event.docs.length; i++) {
        blogsList.add(BlogsModel.fromJson(event.docs[i]));
      }
      for (int x = 0; x < event.docs.length; x++) {
        blogsIdList.add(event.docs[x].id);
      }
    });
  }

  daleteBlog({required String id}) {
    isDeleting.value = true;
    FireStoreMethods().blogs.doc(id).delete().then((value) {
      isDeleting.value = false;
      Get.back();
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "Blog Deleted Successfully",
        backgroundColor: mainColor2,
      );
    }).catchError((onError) {
      isDeleting.value = false;
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "error: ${onError.toString()}",
        backgroundColor: Colors.red,
      );
    });
  }

  Future getDoctorAppointments({required String doctorId}) async {
    isGettingAppointments.value = true;
    await FireStoreMethods()
        .doctors
        .doc(doctorId)
        .collection(appointmentsCollectionKey)
        .orderBy("appointmentCreationDate", descending: true)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        appointmentsList.clear();
        for (int i = 0; i < value.docs.length; i++) {
          appointmentsList.add(AppointmentModel.fromMap(value.docs[i]));
        }
        isGettingAppointments.value = false;
        print("Done");
        update();
      } else {
        isGettingAppointments.value = false;

        appointmentsList.clear();
        print("You don't have appointments");
      }
    });
  }

  addDaysList() {
    daysDateList.clear();
    for (int i = 0; i < 7; i++) {
      daysDateList.add(firstDayDateTime.add(Duration(days: i)));
    }
  }
}
