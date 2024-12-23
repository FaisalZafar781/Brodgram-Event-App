import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../generated/assets.dart';
import '../../../../services/constants/constants.dart';
import '../../../../widgets/CustomDropDown/custom_drop_down.dart';
import '../../../../widgets/CutomTextField/custom_textField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController fullNameController =
      TextEditingController(text: null);
  final TextEditingController emailController =
      TextEditingController(text: null);
  final TextEditingController phoneController =
      TextEditingController(text: null);
  final TextEditingController dobController = TextEditingController(text: null);
  String selectedCountry = "United States";
  String selectedGender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture with Edit Icon
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(Assets.imagesProfileImage),
                ),
                Positioned(
                  bottom: -20,
                  right: -10,
                  child: GestureDetector(
                    onTap: () {
                      // Handle profile picture update
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        Assets.imagesEditIcon,
                        width: 70,
                        height: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // User Name and Email
            const Text(
              "John Wick",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
              "john1@gmail.com",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            // Input Fields
            CustomField(
              controller: fullNameController,
              hintText: 'Full name',
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Full name is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomField(
              controller: emailController,
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email address is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomField(
              controller: phoneController,
              hintText: 'Phone number',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Phone number is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomDropdownField(
                    value: selectedCountry,
                    hintText: "Country",
                    items: const ["United States", "Canada", "India"],
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                    validator: (value) {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdownField(
                    value: selectedGender,
                    hintText: "Gender",
                    items: const ["Male", "Female", "Other"],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                    validator: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Date of birth is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Buttons
            ActionButton(
              text: "Update",
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.white,
              borderColor: AppColors.primaryColor,
              onPressed: () {
                // Handle update
              },
              borderRadius: 25,
            ),
            const SizedBox(height: 15),
            ActionButton(
              text: "Dismiss",
              backgroundColor: AppColors.white,
              textColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
              borderRadius: 25,
            ),
          ],
        ),
      ),
    );
  }
}
