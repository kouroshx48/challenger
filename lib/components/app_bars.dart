import 'package:flutter/material.dart';

//profile screen appbar
PreferredSizeWidget screenAppBar(String text) {
  return AppBar(
    elevation: 0,
    title:  Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
    backgroundColor: Colors.grey[500],
  );
}


