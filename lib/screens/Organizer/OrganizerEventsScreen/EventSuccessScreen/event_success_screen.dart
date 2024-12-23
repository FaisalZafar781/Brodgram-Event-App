import 'package:brogam/screens/Home/HomeScreen/home_screen.dart';
import 'package:brogam/screens/Organizer/OrganizerHomeScreen/organizer_home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../services/constants/constants.dart';
import '../../../../widgets/CutomActionButton/ActionButton.dart';

class EventSuccessScreen extends StatefulWidget {
  const EventSuccessScreen({super.key});

  @override
  State<EventSuccessScreen> createState() => _EventSuccessScreenState();
}

class _EventSuccessScreenState extends State<EventSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset("assets/images/event_success.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: screenHeight * 0.05,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: ActionButton(
                text: "Done",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                borderColor: AppColors.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrganizerHomeScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
