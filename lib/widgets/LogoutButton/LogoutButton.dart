import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../../services/constants/constants.dart';

class LogoutButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width; // Optional width parameter
  final double? height; // Optional height parameter

  const LogoutButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width, // Allow users to provide custom width
    this.height, // Allow users to provide custom height
  });

  @override
  Widget build(BuildContext context) {
    // Calculate button width: use the provided width or fallback to 80% of screen width
    final double buttonWidth = width ?? MediaQuery.of(context).size.width * 0.8;

    // Calculate button height: use the provided height or fallback to 6% of screen height
    final double buttonHeight = height ?? MediaQuery.of(context).size.height * 0.09;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,// Background color is white
          padding: const EdgeInsets.symmetric(horizontal: 32),
          minimumSize: Size(buttonWidth, buttonHeight), // Use the calculated width and height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.primaryColor, width: 1), // Border color and thickness
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center-align the text and icon
          children: [
            Image.asset(Assets.imagesLogout,height:30 ,),
            const SizedBox(width: 8), // Add space between the icon and text
            Text(
              text,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.0427, // For 16px equivalent
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor, // Text color matches the border color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
