import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:retail_store/view/home_view.dart';

class AuthViewModel extends GetxController {
  // var counter = 0.obs;    // RxObject
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  String? email, password, name;

  Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment(){
  //   counter++;
  //   update();
  // }

  // google sign in method
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential);
  }

  // facebook sign in method
  void facebookSignInMethod() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(customPermissions: ['email']);

    final accessToken = result.accessToken?.token;

    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken!);

      await _auth.signInWithCredential(faceCredential);
    }
  }

  // sign in method
  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        print("Login Successfully : $value");
      });
      // jump another page from get method
      Get.offAll(HomeView());
    } catch (e) {
      print(e);
      Get.snackbar('Error Login Account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
