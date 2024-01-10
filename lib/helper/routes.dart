import 'package:get/get.dart';
import 'package:the_cart_app/binders/cart_binding.dart';
import 'package:the_cart_app/binders/login_binding.dart';
import 'package:the_cart_app/binders/register_binding.dart';
import 'package:the_cart_app/screens/cart_screen.dart';
import 'package:the_cart_app/screens/login_screen.dart';
import '../screens/registration_form.dart';

var getPages = [
  GetPage(
      name: login, page: () => const LoginScreen(), binding: LoginBinding()),
  GetPage(
      name: registration,
      page: () => const RegistrationForm(),
      binding: RegisterBinding()),
  GetPage(name: cart, page: () => const CartScreen(), binding: CartBinding()),
];

const login = '/login';
const cart = '/cart';
const registration = '/registration';
