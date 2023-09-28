import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:get/get.dart';
import 'package:retail_store/constance.dart';
import 'package:retail_store/core/view_model/auth_view_model.dart';
import 'package:retail_store/view/auth/register_view.dart';
import 'package:retail_store/view/widgets/custom_button.dart';
import 'package:retail_store/view/widgets/custom_button_social.dart';
import 'package:retail_store/view/widgets/custom_text.dart';
import 'package:retail_store/view/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginView extends GetWidget<AuthViewModel> {
  //const LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome, ",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to Continue",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomeTextFormField(
                  text: "Email",
                  hint: "abcd@gmail.com",
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error you enter null please enter email id");
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextFormField(
                  text: "Password",
                  hint: "**********",
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error you enter null please enter password");
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Forgot Password",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeButton(
                  text: "SIGN IN",
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: "Sign In with Facebook",
                  imageName: "assets/images/facebook.png",
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: "Sign In with Google",
                  onPressed: () {
                    // GoogleSignIn
                    AuthViewModel controller = Get.find<AuthViewModel>();
                    controller.googleSignInMethod();
                  },
                  imageName: "assets/images/google.png",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
