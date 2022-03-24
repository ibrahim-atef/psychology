import 'package:get/get.dart';
 import 'package:psychology/controller/controllers/pateint_home_screen_controller.dart';

class PatientHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PateintHomeScreenController());
  }
}
