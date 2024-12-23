import 'package:brogam/screens/Home/EventBookingScreens/BookingSuccessScreen/booking_success_screen_free.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:flutter/material.dart';

class ReviewTicketSummaryFreeScreen extends StatefulWidget {
  bool isPaid;
  ReviewTicketSummaryFreeScreen({super.key, required this.isPaid});

  @override
  _ReviewTicketSummaryFreeScreenState createState() =>
      _ReviewTicketSummaryFreeScreenState();
}

class _ReviewTicketSummaryFreeScreenState
    extends State<ReviewTicketSummaryFreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Review Ticket Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          final contentPadding = isSmallScreen ? 15.0 : 32.0;
          return Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalEventCard(
                  isOrganizer: false,
                ),
                const SizedBox(height: 16),
                _buildUserDetails(),
                const SizedBox(height: 16),
                const Spacer(),
                ActionButton(
                  text: "Book Slot",
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingSuccessScreenFree(),
                      ),
                    );
                  },
                  borderRadius: 25,
                ),
                const SizedBox(height: 25),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Full Name', 'Sofia Anderson'),
        _buildDetailRow('Phone Number', '+1 (208) 555-0112'),
        _buildDetailRow('Email', 'sofia@email.com'),
      ],
    );
  }
}
