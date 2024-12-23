import 'package:flutter/material.dart';

import '../../screens/Home/NotificationScreen/Notifications/notifications_screen.dart';
import '../../services/constants/constants.dart';
import '../CustomRoundContainer/custom_round_container.dart';

class BellIcon extends StatelessWidget {
  const BellIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 5, right: 30),
      child: Stack(
        children: [
          CustomRoundedContainer(
            padding: const EdgeInsets.all(8),
            showBorder: true,
            borderColor: AppColors.primaryColor,
            radius: 100,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const  NotificationsScreen(),));
              },
              child: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: AppFontSizes.title1,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
