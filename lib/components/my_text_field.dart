import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final controller;

  const MyTextField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.grey[400],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13)
            )
        )
    );
  }
}
