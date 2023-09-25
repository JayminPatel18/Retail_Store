import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {super.key, required this.text, required this.imageName, this.onPressed});

  final String text;
  final String imageName;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        children: [
          Image.asset(
            imageName,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 60,
          ),
          CustomText(
            text: text,
          )
        ],
      ),
    );
  }
}
