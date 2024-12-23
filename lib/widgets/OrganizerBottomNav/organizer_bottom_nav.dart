import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OrganizerBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const OrganizerBottomNav({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.bottomIcon,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: onItemSelected,
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? const Icon(Iconsax.home_2)
                  : const Icon(Iconsax.home_2_copy),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? const Icon(Iconsax.note)
                  : const Icon(Iconsax.note_1_copy),
              label: 'My Events',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? const Icon(Iconsax.user)
                  : const Icon(Iconsax.user_copy),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
