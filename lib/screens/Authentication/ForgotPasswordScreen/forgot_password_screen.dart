import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../VerificationCodeScreen/verification_code_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesForgotPassword),
                  SizedBox(height: screenHeight * 0.040),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.poppins,
                        fontSize: AppFontSizes.title1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '''Don't worry! it happens. Please enter the email address associated with your account''',
                      style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.body,
                          color: AppColors.lighyGreyColor1),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.email),
                    controller: _emailController,
                    hintText: 'Email Address',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: screenHeight * 0.080),
                  ActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const VerificationCodeScreen(),
                          ));
                    },
                    borderColor: AppColors.primaryColor,
                    text: "Submit",
                    textColor: AppColors.white,
                    borderRadius: 25,
                    buttonWidth: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
