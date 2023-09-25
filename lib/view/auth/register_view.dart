import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/core/view_model/auth_view_model.dart';
import 'package:retail_store/view/auth/login_view.dart';
import 'package:retail_store/view/widgets/custom_button.dart';
import 'package:retail_store/view/widgets/custom_text.dart';
import 'package:retail_store/view/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class RegisterView extends GetWidget<AuthViewModel> {
  // const RegisterView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              CustomText(
                text: "Sign Up",
                fontSize: 30,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              CustomeTextFormField(
                text: "Name",
                hint: "abc xyz",
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error you enter null please enter email id");
                  }
                },
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
              SizedBox(
                height: 20,
              ),
              CustomeButton(
                text: "SIGN UP",
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
