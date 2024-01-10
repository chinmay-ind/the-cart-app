import 'dart:convert';

import 'package:flutter/services.dart';

class ParseJSON {
  Future<dynamic> readJson(String path) async {
    try {
      final String response = await rootBundle.loadString(path);
      return await json.decode(response);
    } catch (ex) {
      rethrow;
    }
  }
}

final jsonParser = ParseJSON();
