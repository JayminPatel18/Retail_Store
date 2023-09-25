import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/view/auth/login_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _auth.signOut();
            Get.offAll(LoginView());
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
