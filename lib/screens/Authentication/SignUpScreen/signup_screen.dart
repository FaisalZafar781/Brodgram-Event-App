import 'package:brogam/providers/SignUpScreenProvider.dart';
import 'package:brogam/screens/Authentication/LoginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../generated/assets.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/CustomToggle/custom_toggle.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../../../widgets/PhoneNoField/phone_no_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for form validation
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController(text: "+1");

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, value, child) {
            return value.isLoadingSignUp == true || value.loader == true
                ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey, // Wrap the form fields with Form widget
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: screenHeight * 0.15,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        CustomToggle(
                          initialSelectedIndex: 0,
                          labels: const ['Public User', 'Organizer'],
                          onTap: (int selectedIndex) {
                            print("Selected index: $selectedIndex");
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Create an Account',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.title1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        CustomField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Full Name is required";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                          controller: _fullNameController,
                          hintText: 'Full Name',
                          keyboardType: TextInputType.text,
                        ),
                        CustomField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.email),
                          controller: _emailController,
                          hintText: 'Email Address',
                          keyboardType: TextInputType.text,
                        ),
                        // SizedBox(height: screenHeight * 0.015),
                        PhoneNumberField(
                          countryCodeController: countryCodeController,
                          phoneController: phoneController,
                        ),
                        SizedBox(height: screenHeight * 0.025),
                        CustomField(
                          obscureText: !context.watch<SignUpScreenProvider>().isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters long";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.lock),
                          controller: _passwordController,
                          hintText: 'Password',
                          keyboardType: TextInputType.text,
                          suffixIcon: Consumer<SignUpScreenProvider>(
                            builder: (context, provider, child) {
                              return IconButton(
                                icon: Icon(
                                  provider.isPasswordVisible
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                ),
                                onPressed: provider.togglePasswordVisibility,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.020),
                        ActionButton(
                          backgroundColor: AppColors.primaryColor,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) { // Validate the form
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              String role = "";
                              await value.registerWithEmailAndPassword(
                                  email, password, context, role, "${countryCodeController.text}${phoneController.text}");
                            }
                          },
                          borderColor: AppColors.primaryColor,
                          text: "Sign Up",
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
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                          onTap: () {},
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(Assets.imagesGoogle, height: screenHeight * 0.03),
                                const SizedBox(width: 8),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins, color: AppColors.greyText),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login Now',
                                  style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppFontsFamily.poppins),
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
            );
          },
        ),
      ),
    );
  }
}
