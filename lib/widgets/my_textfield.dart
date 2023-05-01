import 'package:flutter/material.dart';
import 'package:multi_user_app/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.icon});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: kInputTextStyle,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: kHintTextStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
