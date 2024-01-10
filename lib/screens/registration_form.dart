import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_cart_app/controllers/register_controller.dart';
import 'package:the_cart_app/widgets/custom_button.dart';
import 'package:the_cart_app/widgets/custom_text_field.dart';

import '../helper/my_constants.dart';

class RegistrationForm extends GetView<RegisterController> {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Image.asset('assets/images/cart.png'),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              controller: controller.usernameController,
              label: 'Username',
              icon: Icon(
                Icons.person,
                color: myConstant.primaryColor,
              ),
              validator: (val) => controller.isEmailValid(),
              onChanged: (val) {
                controller.onSubmitClicked();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: controller.passwordController,
              label: 'Password',
              obscureText: true,
              icon: Icon(Icons.key, color: myConstant.primaryColor),
              validator: (val) => controller.isPasswordValid(),
              onChanged: (val) {
                controller.onSubmitClicked();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: controller.dobController,
              label: 'Date of Birth',
              icon: Icon(Icons.calendar_month, color: myConstant.primaryColor),
              validator: (val) => controller.isDOBValid(val!),
              onChanged: (val) => {controller.onSubmitClicked()},
              keyBoardType: TextInputType.none,
              readOnly: true,
              onTap: () async {
                await _selectDate(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() => CustomButton(
                  title: 'Register',
                  onTap: controller.proceed.value
                      ? () => controller.registerUser(context)
                      : null,
                )),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already signed up? '),
                InkWell(
                  onTap: () {
                    controller.navigateToSignIn();
                  },
                  child: Text(
                    ' Sign In',
                    style: TextStyle(color: myConstant.primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    await showDatePicker(
            context: context,
            initialDate: DateTime(2005, 01),
            firstDate: DateTime(1947, 8),
            lastDate: DateTime(2101))
        .then((picked) {
      if (picked != null && picked != selectedDate) {
        controller.dobController.text = formatDate(picked);
        controller.onSubmitClicked();
      }
    });
  }
}
