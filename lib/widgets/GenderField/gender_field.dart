import 'package:flutter/material.dart';

class CustomGenderField extends StatefulWidget {
  final String? hintText;
  final Color? hintTextColor;
  final Color? fillColor;
  final Icon? suffixIcon;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final Color? borderColor;

  const CustomGenderField({
    super.key,
    this.hintText,
    this.hintTextColor,
    this.fillColor,
    this.suffixIcon,
    this.validator,
    this.borderRadius,
    this.borderColor,
  });

  @override
  _CustomGenderFieldState createState() => _CustomGenderFieldState();
}

class _CustomGenderFieldState extends State<CustomGenderField> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.fillColor,
        borderRadius: widget.borderRadius,
        border: Border.all(color: widget.borderColor!),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        hint: Text(
          widget.hintText ?? 'Select Gender',
          style: TextStyle(color: widget.hintTextColor),
        ),
        icon: widget.suffixIcon,
        items: ['Male', 'Female', 'Other']
            .map((gender) => DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                ))
            .toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        validator: widget.validator,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
