import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/GenderField/gender_field.dart';
import 'package:brogam/widgets/PhoneNoField/phone_no_field.dart';
import 'package:flutter/material.dart';

import '../ReviewTickerSummaryScreen/ReviewTickerSummaryScreen.dart';

class EventBookingDetailScreen extends StatelessWidget {
   EventBookingDetailScreen({super.key});

   TextEditingController phoneController = TextEditingController();
   TextEditingController countryCodeController = TextEditingController(text: "+1");

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            // Close the current screen (pop the route)
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Personal Details',
            style: TextStyle(
              fontFamily: AppFontsFamily.poppins,
              color: AppColors.black,
              fontSize: AppFontSizes.subtitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Enter full name',
                  hintTextColor: AppColors.IconColors,
                  keyboardType: TextInputType.text,
                  fillColor: AppColors.textFiledColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(20),
                  borderColor: AppColors.lighyGreyColor1,
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                //phone number
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                PhoneNumberField(
                  phoneController: phoneController,
                  countryCodeController: countryCodeController,
                  borderColor: AppColors.lighyGreyColor1,
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                //email
                Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'abc@gmail.com',
                  hintTextColor: AppColors.IconColors,
                  keyboardType: TextInputType.text,
                  fillColor: AppColors.textFiledColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(20),
                  borderColor: AppColors.lighyGreyColor1,
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                //Emergency Contact name
                Text(
                  'Emergency Contact Name',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Enter full name',
                  hintTextColor: AppColors.IconColors,
                  keyboardType: TextInputType.text,
                  fillColor: AppColors.textFiledColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(20),
                  borderColor: AppColors.lighyGreyColor1,
                ),
                //emergency phone number
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                Text(
                  'Emergency Contact Phone Number',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                PhoneNumberField(
                  phoneController: phoneController,
                  countryCodeController: countryCodeController,
                  borderColor: AppColors.lighyGreyColor1,
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                //select Gender
                Text(
                  'Select Gender',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                CustomGenderField(
                  hintText: 'Select Gender',
                  hintTextColor: AppColors.IconColors,
                  fillColor: AppColors.textFiledColor,
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(20),
                  borderColor: AppColors.lighyGreyColor1,
                ),

                SizedBox(
                  height: screenHeight * 0.020,
                ),
                //select Date of Birth
                Text(
                  'Date of Birth',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                CustomField(
                  controller: TextEditingController(),
                  hintText: 'Select Date',
                  hintTextColor: AppColors.IconColors,
                  keyboardType: TextInputType.text,
                  fillColor: AppColors.textFiledColor,
                  suffixIcon: Icon(Icons.calendar_today),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select your date of birth';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(20),
                  borderColor: AppColors.lighyGreyColor1,
                ),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                ActionButton(
                  text: 'Next',
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  borderRadius: 20,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewTicketSummaryScreen(),));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
