import 'package:flutter/material.dart';

import '../../../../widgets/PrimaryButton/CustomPrimaryButton.dart';

class ChangePassword extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            buildPasswordField('Old Password', oldPasswordController),
            buildPasswordField('New Password', newPasswordController),
            buildPasswordField('Confirm Password', confirmPasswordController),
            const Spacer(),
            PrimaryButton(text: 'Change Password', onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.shade200,
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
          suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
