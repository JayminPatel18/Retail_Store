import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({super.key, required this.text, this.onPressed});

 final String text; 
final dynamic onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: EdgeInsets.all(18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: CustomText(
        text: text,
        alignment: Alignment.center,
        color: Colors.white,
      ),
    );
  }
}
