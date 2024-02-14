import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const MyButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
