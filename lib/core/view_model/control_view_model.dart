import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/view/auth/cart_view.dart';
import 'package:retail_store/view/auth/profile_view.dart';
import 'package:retail_store/view/home_view.dart';

class ControlViewModel extends GetxController {
  RxInt _navigatorValue = 0.obs;
  RxInt get navigatorValue => _navigatorValue;

  Rx<Widget> _currentScreen = Rx<Widget>(HomeView());
  Rx<Widget> get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue.value = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen.value = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen.value = CartView();
          break;
        }
      case 2:
        {
          _currentScreen.value = ProfileView();
          break;
        }
        default:
        // Handle any unexpected selectedValue
        break;
    }
    update();
  }
}
