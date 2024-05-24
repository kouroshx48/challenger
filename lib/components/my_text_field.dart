import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isActive;
  final Widget? suffixWidget;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isActive = true,
      this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        enabled: isActive,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
            suffixIcon: suffixWidget
        )
    );
  }
}
