import 'package:get/get.dart';
import 'package:psychology/controller/controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>AuthController() ,fenix: false);
  }

}