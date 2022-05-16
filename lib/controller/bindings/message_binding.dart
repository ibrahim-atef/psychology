import 'package:get/get.dart';
import 'package:psychology/controller/controllers/messages_controller.dart';

class MessagesBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MessagesController() );
  }

}