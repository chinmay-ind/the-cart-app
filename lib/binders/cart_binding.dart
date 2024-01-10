import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    ///Attaches the controller when it is required
    Get.lazyPut(() => CartController());
  }
}
