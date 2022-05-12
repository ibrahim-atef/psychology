import 'package:get/get.dart';

import '../controllers/patient_controller/patient_home_screen_controller.dart';

class PatientHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PatientHomeScreenController());
  }
}
