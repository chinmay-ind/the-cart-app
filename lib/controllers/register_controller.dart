import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:the_cart_app/helper/my_constants.dart';
import 'package:the_cart_app/models/user_model.dart';
import '../helper/routes.dart';
import '../helper/shared_prefs.dart';
import '../repository/my_repo.dart';

class RegisterController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var dobController = TextEditingController();
  var selectedDate = ''.obs;
  var proceed = false.obs;
  var userList = <Users>[].obs;

  String? isEmailValid() {
    return usernameController.text.isValidEmail()
        ? null
        : 'Please enter a valid email';
  }

  String? isPasswordValid() {
    if (passwordController.text.isNotEmpty &&
        passwordController.text.length < 3) {
      return 'Please enter a valid password';
    } else {
      return null;
    }
  }

  String? isDOBValid(String val) {
    return validDate(val) ? null : 'Please enter a valid date';
  }

  bool onSubmitClicked() {
    if ((usernameController.text.isNotEmpty && isEmailValid() == null) &&
        (passwordController.text.isNotEmpty && isPasswordValid() == null) &&
        validDate(dobController.text)) {
      return proceed.value = true;
    }
    return proceed.value = false;
  }

  void clearTextField() {
    usernameController.clear();
    passwordController.clear();
    dobController.clear();
  }

  void registerUser(BuildContext context) {
    hideKeyboard(context);
    EasyLoading.show();
    var addUser = myRepo.getUsers();
    addUser.users?.add(Users(
        username: usernameController.text,
        password: passwordController.text,
        dob: dobController.text));
    localData.userList = jsonEncode(addUser);
    Get.snackbar('Sign Up Successful', 'Proceed to Login',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP);
    EasyLoading.dismiss();
  }

  void navigateToSignIn() {
    clearTextField();
    Get.toNamed(login);
  }
}
