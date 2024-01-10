import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_cart_app/controllers/login_controller.dart';
import '../helper/my_constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
              onChanged: (val) => {controller.onSubmitClicked()},
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
              onChanged: (val) => {controller.onSubmitClicked()},
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() => CustomButton(
                  title: 'Submit',
                  onTap: controller.proceed.value
                      ? () => controller.validateUser(context)
                      : null,
                )),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Haven`t signed up yet? '),
                InkWell(
                  onTap: () => controller.navigateToSignUp(),
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                        color: myConstant.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
