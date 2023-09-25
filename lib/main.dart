import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:retail_store/helper/binding.dart';
import 'package:get/get.dart';
import 'package:retail_store/view/control_view.dart';

import 'core/view_model/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // you need to make sure that you've properly registered the AuthViewModel in the Get dependency injection system using Get.put(AuthViewModel()) or Get.lazyPut(() => AuthViewModel()).
    Get.put(AuthViewModel());
    return GetMaterialApp(
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ControlView(),
        ));
  }
}
