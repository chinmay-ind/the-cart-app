import 'package:get/get.dart';
import 'package:the_cart_app/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    ///Attaches the controller when it is required
    Get.lazyPut(() => LoginController());
  }
}