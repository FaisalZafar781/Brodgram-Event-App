import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../services/constants/constants.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController countryCodeController;
  final Color? borderColor;

  // Update the constructor to accept controllers as parameters
  PhoneNumberField({
    super.key,
    required this.phoneController,
    required this.countryCodeController,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.textFiledColor,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: borderColor ?? Colors.transparent),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: countryCodeController.text,
                icon: const Icon(Iconsax.arrow_down),
                onChanged: (String? newValue) {
                  countryCodeController.text = newValue!;
                },
                items: <String>['+1', '+44', '+91', '+61']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: AppColors.lighyGreyColor1,
                          fontFamily: AppFontsFamily.poppins),
                    ),
                  );
                }).toList(),
                underline: const SizedBox.shrink(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textFiledColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: borderColor ?? Colors.transparent),
                ),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: TextStyle(
                        color: AppColors.IconColors,
                        fontFamily: AppFontsFamily.poppins),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
