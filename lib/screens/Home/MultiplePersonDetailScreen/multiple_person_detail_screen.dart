import 'package:brogam/screens/Home/EventBookingScreens/ReviewTickerSummaryScreen/ReviewTickerSummaryScreen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/GenderField/gender_field.dart';
import 'package:brogam/widgets/PhoneNoField/phone_no_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class MultiplePersonDetailScreen extends StatefulWidget {
  bool isPaid;
  int index = 1;
  MultiplePersonDetailScreen(
      {super.key, required this.index, required this.isPaid});

  @override
  State<MultiplePersonDetailScreen> createState() =>
      _MultiplePersonDetailScreenState();
}

class _MultiplePersonDetailScreenState
    extends State<MultiplePersonDetailScreen> {
  final TextEditingController dobController = TextEditingController(text: null);
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController(text: "+1");

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Person ${widget.index + 1} ',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    color: AppColors.black,
                    fontSize: AppFontSizes.title1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
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
                  countryCodeController: countryCodeController,
                  phoneController: phoneController,
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
                  countryCodeController: countryCodeController,
                  phoneController: phoneController,
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
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                  borderRadius: BorderRadius.circular(25),
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
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(1998, 6, 26),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        dobController.text =
                            DateFormat("dd/MM/yyyy").format(pickedDate);
                      });
                    }
                  },
                  controller: dobController,
                  hintText: "Date of Birth",
                  keyboardType: TextInputType.none,
                  suffixIcon:
                      const Icon(Iconsax.calendar_1_copy, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date of birth is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                ActionButton(
                  text: 'Next',
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  borderRadius: 25,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReviewTicketSummaryScreen(isPaid: widget.isPaid)
                          // widget.isPaid == true
                          //     ? ReviewTicketSummaryScreen(isPaid: widget.isPaid)
                          //     : ReviewTicketSummaryFreeScreen(
                          //         isPaid: widget.isPaid),
                        ));
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
