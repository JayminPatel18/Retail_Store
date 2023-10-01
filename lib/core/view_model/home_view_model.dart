import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/view/auth/cart_view.dart';
import 'package:retail_store/view/auth/profile_view.dart';
import 'package:retail_store/view/home_view.dart';

class HomeViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
