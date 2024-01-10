import 'dart:convert';
import 'package:the_cart_app/helper/shared_prefs.dart';
import 'package:the_cart_app/models/product_model.dart';
import 'package:the_cart_app/models/user_model.dart';

class MyRepository {
  UserModel getUsers() {
    try {
      var response = jsonDecode(localData.userList);
      return UserModel.fromJson(response);
    } catch (ex) {
      rethrow;
    }
  }

  ProductModel getProducts() {
    try {
      var response = jsonDecode(localData.productList);
      return ProductModel.fromJson(response);
    } catch (ex) {
      rethrow;
    }
  }
}

final myRepo = MyRepository();
