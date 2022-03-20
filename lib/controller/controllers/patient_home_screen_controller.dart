import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:psychology/model/doctor_info_model.dart';
import 'package:psychology/services/firestore_methods.dart';

class PatientHomeScreenController extends GetxController {
  Stream<QuerySnapshot>? doctorsStream;
   List<dynamic> doctorsList = <DoctorInfo>[].obs;
  @override
  void onInit() async {
    // TODO: implement onInit

   getDoctorsInfo();
    super.onInit();
  }
  getDoctorsInfo() async {
    doctorsList=[];
    // userStream = await FireStoreMethods().GetUserByUserName(textEditingController.text);
    doctorsStream = await FireStoreMethods().doctors.snapshots();

    update();
  }
}
