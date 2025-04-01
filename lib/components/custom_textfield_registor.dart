import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;

  const CustomTextField({
    required this.controller,
    required this.label,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        cursorColor: Colors.black,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true, // Enables fillColor
          fillColor: Colors.grey[200], // Light grey background
          hintText: label,
          
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),

          // Border Styling
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.grey[600] ?? Colors.grey),

          ),

          // Focused Border (When user taps)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
      ),
    );
  }
}
