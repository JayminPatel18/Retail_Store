import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/core/view_model/auth_view_model.dart';
import 'package:retail_store/view/auth/login_view.dart';

import 'package:retail_store/view/home_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeView()
          : LoginView();
    });
  }
}
