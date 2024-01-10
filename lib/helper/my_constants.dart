import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyConstants {
  Color primaryColor = Colors.purple;
}

final myConstant = MyConstants();

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

///format date
String formatDate(DateTime dateTime) {
  var formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(dateTime);
}

///hide softkeyboard
void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

///validateDate
bool validDate(String input) {
  try {
    final DateTime dateTime = DateFormat('dd-MM-yyyy').parseStrict(input);
    return true;
  } catch (e) {
    return false;
  }
}
