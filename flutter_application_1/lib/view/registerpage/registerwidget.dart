
  import 'package:flutter/material.dart';

Widget list({required String text,
  required TextEditingController controller,
   bool obscureText=false,
   String? error,
  TextInputType? keboardinputType,
  IconButton? suffixicon}) {
    return TextField(
                
               controller: controller,
               keyboardType: keboardinputType,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: text,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15),
                    errorText: error,
                    suffixIcon: suffixicon,
                    
                  ),
                
              );
  }