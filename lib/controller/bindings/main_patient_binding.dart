import 'package:get/get.dart';
import 'package:psychology/controller/controllers/main_patient_controller.dart';

class MainPatientBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainPatientController(), );
  }
}
