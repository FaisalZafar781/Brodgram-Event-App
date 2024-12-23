import 'package:flutter/material.dart';
import '../../services/constants/constants.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? errorText;
  final Widget? prefixIcon;
  final bool? isNavigate;
  final bool? readOnly;
  final Function(String)? onChanged;
  final double? height;
  final double? width;
  final int? maxLine;
  final bool? obscureText;
  final BorderRadius? borderRadius;
  final Color? borderColor; // Optional border color parameter
  final Color? fillColor; // Optional fill color parameter
  final Color? hintTextColor; // Optional hint text color parameter
  final VoidCallback? onTap;

  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    required this.validator,
    this.maxLine,
    this.readOnly,
    this.errorText,
    this.prefixIcon,
    this.isNavigate,
    this.onChanged,
    this.height,
    this.width,
    this.obscureText,
    this.borderRadius,
    this.borderColor, // Initialize optional borderColor
    this.hintTextColor, // Initialize optional hintTextColor
    this.fillColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height ?? 70,
          // width: width?? 0,
          child: TextFormField(
            maxLines: maxLine ?? 1,
            // minLines: 1,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            readOnly: readOnly ?? false, // Prevents keyboard from showing up
            onTap: onTap, // Directly use onTap here
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintTextColor ?? AppColors.IconColors,
                fontFamily: AppFontsFamily.poppins,
              ),
              filled: true,
              fillColor: fillColor ?? AppColors.textFiledColor,

              // Default border when TextFormField is not focused
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.lighyGreyColor1,
                  width: 0.5,
                ),
              ),

              // Border when TextFormField is focused
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.lighyGreyColor1,
                  width: 1.0, // Slightly thicker when focused
                ),
              ),
              suffixIcon: suffixIcon,
              suffixIconColor: AppColors.IconColors,
              errorText: errorText,
              prefixIcon: prefixIcon,
              prefixIconColor: AppColors.IconColors,
            ),
          ),
        ),
        if (errorText != null) // Show error text when validation fails
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 5),
            child: Text(
              // errorText!,
              '',
              style: TextStyle(
                color: Colors.red, // Red color for error text
                fontSize: 12, // Adjust font size of error text
              ),
            ),
          ),
      ],
    );
  }
}
