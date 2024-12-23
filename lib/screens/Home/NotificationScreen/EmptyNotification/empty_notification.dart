import 'package:flutter/material.dart';
import '../../../../services/constants/constants.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = screenHeight * 0.05; // 224px / 812px ≈ 0.275
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Text(
          'Notifications',
          style: TextStyle(
              fontSize: 18,
              color: AppColors.black,
              fontFamily: AppFontsFamily.poppins),
        )),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Center(
              child: Image.asset(
                "assets/image/NotificationBell.png",
                height: MediaQuery.of(context).size.height *
                    (268 / MediaQuery.of(context).size.height),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.09),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "There are no notifications yet!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontsFamily.poppins,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                margin: const EdgeInsets.only(right: 60, left: 60),
                child: const Text(
                  'Your notifications will appear on this page',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFontsFamily.poppins,
                    color: AppColors.greyText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
