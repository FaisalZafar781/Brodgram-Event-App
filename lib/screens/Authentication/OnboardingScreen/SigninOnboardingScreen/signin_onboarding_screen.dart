import 'package:brogam/providers/auth_provider.dart';
import 'package:brogam/screens/Authentication/LoginScreen/login_screen.dart';
import 'package:brogam/screens/Authentication/SignUpScreen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:brogam/generated/assets.dart';
import 'package:provider/provider.dart';
import '../../../../services/constants/constants.dart';
import '../../../../widgets/CutomActionButton/ActionButton.dart';

class SigninOnboardingScreen extends StatefulWidget {
  const SigninOnboardingScreen({super.key});

  @override
  _SigninOnboardingScreenState createState() => _SigninOnboardingScreenState();
}

class _SigninOnboardingScreenState extends State<SigninOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<AuthProvider>(
      builder: (context, value , child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: value.loader == true ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)) : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.imagesSignInOnboarding,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """Let's you Sign In""",
                            style: TextStyle(
                              fontFamily: AppFontsFamily.poppins,
                              fontSize: AppFontSizes.title1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.020),
                      InkWell(
                        onTap: () async {
                        await   value.signInWithGoogle(context);
                        },
                        child: Container(
                          height: screenHeight * 0.06,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center items horizontally
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Center items vertically
                            children: [
                              Image.asset(Assets.imagesGoogle,
                                  height: screenHeight * 0.03),
                              const SizedBox(
                                  width:
                                      8), // Add some space between image and text
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppFontSizes.body),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.030),
                      const Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 1,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Or"),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 1,
                          )),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.030),
                      ActionButton(
                        backgroundColor: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        borderColor: AppColors.primaryColor,
                        text: "Sign In With Email",
                        textColor: AppColors.white,
                        borderRadius: 25,
                        buttonWidth: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontFamily: AppFontsFamily.poppins),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpScreen(),
                                    ));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontFamily: AppFontsFamily.poppins,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
