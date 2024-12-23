import 'package:brogam/screens/Authentication/ResetPasswordScreen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../generated/assets.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
    ),
    decoration: BoxDecoration(
      color: AppColors.textFiledColor,
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(5),
    ),
  );

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
                      'Verification Code',
                      style: TextStyle(
                        fontFamily: AppFontsFamily.poppins,
                        fontSize: AppFontSizes.title1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '''A 4 digit code has been sent to''',
                      style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.body,
                          color: AppColors.lighyGreyColor1),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '''Loisbucker@gmail.com''',
                      style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.body,
                          color: AppColors.black),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Center(
                    child: Pinput(
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  ActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPasswordScreen()));
                    },
                    borderColor: AppColors.primaryColor,
                    text: "Verify",
                    textColor: AppColors.white,
                    borderRadius: 25,
                    buttonWidth: double.infinity,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Resend Code",
                        style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: AppFontSizes.body1,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        "1:20 min left",
                        style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: AppFontSizes.small,
                            color: AppColors.lighyGreyColor1),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
