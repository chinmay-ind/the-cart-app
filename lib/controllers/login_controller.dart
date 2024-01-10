import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:the_cart_app/helper/my_constants.dart';
import 'package:the_cart_app/helper/routes.dart';
import 'package:the_cart_app/repository/my_repo.dart';

import '../helper/shared_prefs.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var proceed = false.obs;

  ///check if email is valid
  String? isEmailValid() {
    return usernameController.text.isValidEmail()
        ? null
        : 'Please enter a valid email';
  }

  ///check if password is valid
  String? isPasswordValid() {
    if (passwordController.text.isNotEmpty &&
        passwordController.text.length < 3) {
      return 'Please enter a valid password';
    } else {
      return null;
    }
  }

  bool onSubmitClicked() {
    return proceed.value = ((usernameController.text.isNotEmpty &&
                isEmailValid() == null) &&
            (passwordController.text.isNotEmpty && isPasswordValid() == null))
        ? true
        : false;
  }

  void validateUser(BuildContext context) {
    var userAuthenticated = false;
    hideKeyboard(context);
    EasyLoading.show();
    var users = myRepo.getUsers().users!;
    for (var element in users) {
      if ((usernameController.text == element.username) &&
          (passwordController.text == element.password)) {
        userAuthenticated = true;
        Future.delayed(const Duration(seconds: 2), () {
          localData.loggedInUser = usernameController.text;
          navigateToCart();
          clearTextField();
          EasyLoading.dismiss();
        });
        break;
      }
    }
    if (!userAuthenticated) {
      EasyLoading.dismiss();
      Get.snackbar('Incorrect Details',
          'Seems like the username or password is incorrect',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP);
    }
  }

  void clearTextField() {
    usernameController.clear();
    passwordController.clear();
  }

  navigateToCart() {
    Get.toNamed(cart);
  }

  navigateToSignUp() {
    Get.toNamed(registration);
  }
}
