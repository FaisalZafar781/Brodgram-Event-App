import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/BookingsProvider.dart';

class BookingsToggle extends StatelessWidget {
  const BookingsToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 2,
        //     blurRadius: 4,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ongoing Button
          GestureDetector(
            onTap: () {
              bookingProvider.setOngoing(true);
            },
            child: Container(
              width: 105,
              height: 41,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: bookingProvider.isOngoing ? AppColors.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: Text(
                  'Ongoing',
                  style: TextStyle(
                    color: bookingProvider.isOngoing ? Colors.white : AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          // Completed Button
          GestureDetector(
            onTap: () {
              bookingProvider.setOngoing(false);
            },
            child: Container(
              height: 41,
              width: 105,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: bookingProvider.isOngoing ? Colors.transparent : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: Text(
                  'Completed',
                  style: TextStyle(
                    color: bookingProvider.isOngoing ? AppColors.primaryColor : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
