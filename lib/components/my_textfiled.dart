import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled({super.key, this.controller, required this.hintText, required this.obscureText});
  final controller;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color : Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade300),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),

      ),
    );
  }
}
