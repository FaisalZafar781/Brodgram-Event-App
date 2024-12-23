import 'package:flutter/material.dart';
import '../../services/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width; // Optional width parameter
  final double? height; // Optional height parameter

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width, // Allow users to provide custom width
    this.height, // Allow users to provide custom height
  });

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = width ?? MediaQuery.of(context).size.width * 0.8;
    final double buttonHeight = height ?? MediaQuery.of(context).size.height * 0.06;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          minimumSize: Size(buttonWidth, buttonHeight), // Use the calculated width and height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
                fontSize : MediaQuery.of(context).size.width * 0.0427, // For 16px equivalent

            fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
