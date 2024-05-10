import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/core/view_model/auth_view_model.dart';
import 'package:retail_store/core/view_model/control_view_model.dart';
import 'package:retail_store/view/auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
    final authViewModel = Get.find<AuthViewModel>();
    final controlViewModel = Get.put(ControlViewModel());
    
    return (authViewModel.user == null)
        ? LoginView()
        : Scaffold(
            body: controlViewModel.currentScreen.value, // Accessing the value property
            bottomNavigationBar: bottomNavigationBar(),
          );
  });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
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


// final user = controller.user;

//       if (user != null) {
//         // Register HomeViewModel before using it
//         Get.put(ControlViewModel()); // You may need to customize this according to your needs
//         final currentScreen = Get.find<ControlViewModel>().currentScreen.value;

//         // ignore: unnecessary_null_comparison
//         if (currentScreen != null) {
//           return Scaffold(
//             body: controller.currentScreen,
//             bottomNavigationBar: bottomNavigationBar(),
//           );
//         } else {
//           // Handle the case when currentScreen is null
//           return Scaffold(
//             body: Center(
//               child: Text("Error: Current screen is null."),
//             ),
//           );
//         }
//       }