import 'package:get/get.dart';
import 'package:psychology/controller/controllers/doctor_controller/doctor_main_controller.dart';

class MainDoctorBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(
      MainDoctorController(),
    );
  }
}
