import 'package:flutter/material.dart';
import 'package:the_cart_app/helper/my_constants.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const CustomButton({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            foregroundColor: myConstant.primaryColor,
            backgroundColor: myConstant.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            shadowColor: myConstant.primaryColor.withOpacity(0.5),
            elevation: 2),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
