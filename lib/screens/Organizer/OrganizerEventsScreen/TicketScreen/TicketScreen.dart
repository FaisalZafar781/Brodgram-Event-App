import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/DottedDivider/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Sofia\'s Ticket',
          style: TextStyle(
            color: Colors.black,
            // fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              _buildDetailsCard(screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildBarcodeCard(screenHeight, screenWidth),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessCard(double screenHeight, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
          Row(
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
          ),
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
            SizedBox(height: screenHeight * 0.01),
            _buildDetailRow("Event Date & Time", "Dec 15 - 10:00 pm"),
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
