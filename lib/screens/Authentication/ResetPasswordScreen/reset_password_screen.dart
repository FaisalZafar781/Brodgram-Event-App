import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
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
                  Image.asset(Assets.imagesMessages),
                  SizedBox(height: screenHeight * 0.040),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.poppins,
                        fontSize: AppFontSizes.title1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    borderRadius: BorderRadius.circular(20),
                    fillColor: Colors.grey[100],
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.lock),
                    controller: _passwordController,
                    hintText: 'password',
                    keyboardType: TextInputType.text,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        false
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    borderRadius: BorderRadius.circular(20),
                    fillColor: Colors.grey[100],
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.lock),
                    controller: _passwordController,
                    hintText: 'Confirm Password',
                    keyboardType: TextInputType.text,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        false
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.080),
                  ActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {},
                    borderColor: AppColors.primaryColor,
                    text: "Reset Password",
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
