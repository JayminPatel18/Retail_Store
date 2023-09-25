// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:retail_store/core/view_model/auth_view_model.dart';


// // state management

// // getBuilder -- not raeactive

// // Getx  -- reactive -- stream

// // obx  


// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthViewModel viewModel = Get.put(AuthViewModel());

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Center(
//           //   child: GetX<AuthViewModel>(
//           //       init: AuthViewModel(),
//           //       builder: (value) => Text("${value.counter}")),
//           // ),
//           Obx(() => (Text("${viewModel.counter.value}"))),

//           // RaisedButton(onPressed:() {})
//           GetBuilder<AuthViewModel>(builder:(value) => ElevatedButton(onPressed: () {
//             value.increment();
//           }, child: Text("increament ")))
//         ],
//       ),
//     );
//   }
// }
