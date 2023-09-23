import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  const MyButton({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green.shade800,
        ),
        child: Center(
          child: Text(text,
          style: TextStyle(
            color: Colors.white,
                fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
        ),
      ),
    );
  }
}
