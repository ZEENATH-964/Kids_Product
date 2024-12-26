import 'package:flutter/material.dart';

void showSnack(BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar( 

    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(20),
      content: Text(text)),
  );
}
