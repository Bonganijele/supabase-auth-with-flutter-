import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;

  const CustomElevatedButton({
    required this.onPressed,
    required this.label,
    this.backgroundColor = Colors.blueAccent,
    this.textColor = Colors.black,
    this.height = 50.0,  // Default height
    this.width = double.infinity,  // Default width to take full available space
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),  // No rounded corners
          ),
        ),
      ),
    );
  }
}
