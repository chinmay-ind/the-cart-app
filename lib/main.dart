import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_cart_app/helper/shared_prefs.dart';
import 'helper/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localData.initSharedPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialRoute: localData.loggedInUser.isEmpty ? login : cart,
    );
  }
}
