import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/core/view_model/auth_view_model.dart';
import 'package:retail_store/core/view_model/home_view_model.dart';
import 'package:retail_store/view/auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.user;

      if (user != null) {
        // Register HomeViewModel before using it
        Get.put(HomeViewModel()); // You may need to customize this according to your needs
        final currentScreen = Get.find<HomeViewModel>().currentScreen.value;

        if (currentScreen != null) {
          return Scaffold(
            body: currentScreen,
            bottomNavigationBar: bottomNavigationBar(),
          );
        } else {
          // Handle the case when currentScreen is null
          return Scaffold(
            body: Center(
              child: Text("Error: Current screen is null."),
            ),
          );
        }
      }

        return LoginView();
      
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: '',
              activeIcon: Text("Explore"),
              icon: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              label: '',
              activeIcon: Text("Cart"),
              icon: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              label: '',
              activeIcon: Text("Account"),
              icon: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              ))
        ],
        currentIndex: controller.navigatorValue.value,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
