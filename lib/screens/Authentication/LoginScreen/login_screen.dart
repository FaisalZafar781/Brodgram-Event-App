import 'package:brogam/providers/LocationProvider.dart';
import 'package:brogam/screens/Authentication/SignUpScreen/signup_screen.dart';
import 'package:brogam/screens/Home/HomeScreen/home_screen.dart';
import 'package:brogam/screens/Organizer/OrganizerHomeScreen/organizer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../generated/assets.dart';
import '../../../providers/LoginScreenProvider.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/CustomToggle/custom_toggle.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../ForgotPasswordScreen/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  int selectedIndex = 0;
  bool _isChecked = false;
  double screenHeight = 0;
  double screenWidth = 0;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Consumer<LoginScreenProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: provider.loader == true || provider.isLoadingSignIn == true
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 10),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: screenHeight * 0.15,
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            SizedBox(
                              width: screenHeight * 0.3,
                              child: CustomToggle(
                                initialSelectedIndex: 0,
                                labels: const ['Public User', 'Organizer'],
                                onTap: (int index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Login to your Account',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    fontSize: AppFontSizes.title1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Form(
                              key: _formKey, // Wrap fields with Form widget
                              child: Column(
                                children: [
                                  CustomField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Email is required";
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                                          .hasMatch(value)) {
                                        return "Enter a valid email";
                                      }
                                      return null;
                                    },
                                    prefixIcon: const Icon(Icons.email),
                                    controller: _emailController,
                                    hintText: 'Email Address',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  CustomField(
                                    obscureText: !provider.isPasswordVisible,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password is required";
                                      }
                                      return null;
                                    },
                                    prefixIcon: const Icon(Icons.lock),
                                    controller: _passwordController,
                                    hintText: 'Password',
                                    keyboardType: TextInputType.text,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        provider.isPasswordVisible
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded,
                                      ),
                                      onPressed:
                                          provider.togglePasswordVisibility,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _isChecked = value!;
                                              });
                                            },
                                          ),
                                          const Text(
                                            'Remember me',
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontsFamily.poppins,
                                              color: AppColors.greyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPassword(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            fontFamily: AppFontsFamily.poppins,
                                            color: AppColors.secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.020),
                                  ActionButton(
                                    backgroundColor: AppColors.primaryColor,
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        if (selectedIndex == 0) {
                                          final locationProvider =
                                              Provider.of<LocationProvider>(
                                                  context,
                                                  listen: false);
                                          locationProvider
                                              .getCurrentLocation(context)
                                              .then((_) {});
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen()),
                                          );
                                        } else if (selectedIndex == 1) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrganizerHomeScreen(),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    borderColor: AppColors.primaryColor,
                                    text: "Sign In",
                                    textColor: AppColors.white,
                                    borderRadius: 25,
                                    buttonWidth: double.infinity,
                                  ),
                                  SizedBox(height: screenHeight * 0.020),
                                  const Row(
                                    children: [
                                      Expanded(
                                          child: Divider(
                                        thickness: 1,
                                      )),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text("Or"),
                                      ),
                                      Expanded(
                                          child: Divider(
                                        thickness: 1,
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.020),
                                  InkWell(
                                    onTap: () {
                                      provider.signInWithGoogle(context);
                                    },
                                    child: Container(
                                      height: screenHeight * 0.06,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(Assets.imagesGoogle,
                                              height: screenHeight * 0.03),
                                          const SizedBox(width: 8),
                                          Text(
                                            "Continue with Google",
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontsFamily.poppins,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Don\'t have an account?',
                                          style: TextStyle(
                                            fontFamily: AppFontsFamily.poppins,
                                            color: AppColors.greyText,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: AppColors.secondaryColor,
                                              fontFamily:
                                                  AppFontsFamily.poppins,
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
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
