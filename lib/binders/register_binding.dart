import 'package:get/get.dart';
import 'package:the_cart_app/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    ///Attaches the controller when it is required

    Get.lazyPut(() => RegisterController());
  }
}
