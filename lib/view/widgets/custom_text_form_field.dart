import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomeTextFormField extends StatelessWidget {
   CustomeTextFormField(
      {
      required this.text,
      required this.hint,
      required this.onSave,
      required this.validator,
      });

  final String text;
  final String hint;
  final dynamic onSave;                   // final Function onSave;
  final dynamic validator;                // final Function validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white),
          )
        ],
      ),
    );
  }
}
