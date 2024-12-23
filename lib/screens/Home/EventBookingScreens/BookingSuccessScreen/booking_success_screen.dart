import 'package:brogam/screens/Home/BookingsScreen/BookingsScreen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:brogam/widgets/DottedDivider/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BookingSuccessScreen extends StatelessWidget {
  bool? isBooking;
  BookingSuccessScreen({
    super.key,
    this.isBooking = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          AppColors.screenBgColor, // Replace with your AppColors if used
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.035,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              _buildSuccessCard(screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildDetailsCard(screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildBarcodeCard(screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              isBooking == false
                  ? ActionButton(
                      text: "Go To Bookings",
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.white,
                      borderColor: AppColors.primaryColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookingsScreen(),
                            ));
                      },
                      borderRadius: 25,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessCard(double screenHeight, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset("assets/images/success.png", height: screenHeight * 0.06),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "Booking Success!",
            style: TextStyle(fontSize: screenWidth * 0.06),
          ),
          SizedBox(height: screenHeight * 0.02),
          isBooking == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/facebook.png",
                        height: screenHeight * 0.05),
                    SizedBox(width: screenWidth * 0.08),
                    Image.asset("assets/images/linkedin.png",
                        height: screenHeight * 0.05),
                    SizedBox(width: screenWidth * 0.08),
                    Image.asset("assets/images/instagram.png",
                        height: screenHeight * 0.05),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildDetailsCard(double screenHeight, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderRow("Ticket Details", icon: Iconsax.arrow_up_2_copy),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow("Event Name", "Swimming Competition"),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow("Event Category", "Swimming"),
            isBooking == false
                ? SizedBox(height: screenHeight * 0.01)
                : Container(),
            isBooking == false
                ? _buildDetailRow("Event Date & Time", "Dec 15 - 10:00 pm")
                : Container(),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow("Payment Time", "25-02-2023, 13:22:16"),
            SizedBox(height: screenHeight * 0.01),
            DottedDivider(
              height: 1,
              dotWidth: 1.5,
              spacing: 5.0,
              color: Colors.grey[300]!,
            ),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow("Full Name", "Sofia Anderson"),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow("Phone Number", "+1 (208) 555-0112"),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow("Email", "sofia@email.com"),
            SizedBox(height: screenHeight * 0.01),
            DottedDivider(
              height: 1,
              dotWidth: 1.5,
              spacing: 5.0,
              color: Colors.grey[300]!,
            ),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow('1 Ticket', '\$20'),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow('Service Fees', '\$2'),
            SizedBox(height: screenHeight * 0.01),
            DottedDivider(
              height: 1,
              dotWidth: 1.5,
              spacing: 5.0,
              color: Colors.grey[300]!,
            ),
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow(
              'Total Payment',
              '\$22',
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBarcodeCard(double screenHeight, double screenWidth) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          "assets/images/bar_code.png",
          width: screenWidth * 0.6,
          height: screenHeight * 0.12,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(String title, {required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
