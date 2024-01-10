import 'package:flutter/material.dart';

import '../helper/my_constants.dart';

class CustomTextField extends StatelessWidget {
  final Icon icon;
  final String label;
  final String? hint;
  final bool? obscureText;
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final bool? readOnly;

  const CustomTextField(
      {required this.icon,
      super.key,
      required this.controller,
      this.onSaved,
      this.obscureText,
      this.onChanged,
      this.onTap,
      this.validator,
      this.keyBoardType,
      this.readOnly,
      required this.label,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow, width: 5.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myConstant.primaryColor, width: 5.0),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 5.0),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: myConstant.primaryColor, width: 5.0),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        prefixIcon: icon,
        hintText: hint,
        labelText: label,
      ),
      keyboardType: keyBoardType,
      onTap: onTap,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
