import 'package:brogam/screens/Home/EventBookingScreens/BookingSuccessScreen/booking_success_screen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:brogam/widgets/DottedDivider/dotted_divider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../widgets/VerticalEventCard/vertical_event_card.dart';
import '../AddCardScreen/add_card_screen.dart';

class ReviewTicketSummaryScreen extends StatefulWidget {
  bool isPaid;
  ReviewTicketSummaryScreen({super.key, required this.isPaid});

  @override
  _ReviewTicketSummaryScreenState createState() =>
      _ReviewTicketSummaryScreenState();
}

class _ReviewTicketSummaryScreenState extends State<ReviewTicketSummaryScreen> {
  String _selectedPayment = 'Paypal';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
          return SingleChildScrollView(
            child: Padding(
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
                  _buildPaymentSummary(),
                  const SizedBox(height: 16),
                  _buildCreditDebitCardSection(),
                  const SizedBox(height: 16),
                  _buildMorePaymentOptions(),
                  const SizedBox(height: 16),
                  ActionButton(
                    text: "Book Slot",
                    backgroundColor: AppColors.primaryColor,
                    textColor: AppColors.white,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingSuccessScreen(),
                        ),
                      );
                    },
                    borderRadius: 25,
                  )
                ],
              ),
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
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
      ],
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      children: [
        _buildDetailRow('1 Ticket', '\$20', isBold: true),
        _buildDetailRow('Service Fees', '\$2', isBold: true),
        const SizedBox(
          height: 10,
        ),
        DottedDivider(
          height: 1,
          dotWidth: 3,
          spacing: 15.0,
          color: Colors.grey[300]!,
        ),
        const SizedBox(
          height: 10,
        ),
        _buildDetailRow('Total', '\$22', isBold: true),
        const SizedBox(
          height: 8,
        ),
        Divider(
          color: Colors.grey.shade500,
        ),
      ],
    );
  }

  Widget _buildCreditDebitCardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Credit & Debit Card',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Icon(Iconsax.card_copy, color: AppColors.black),
            title: const Text(
              'Add Card',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.black),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCardScreen(),
                  ));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMorePaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'More Payment Options',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
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
              _buildPaymentOption('Paypal', 'assets/images/paypal.png'),
              _buildPaymentOption('Apple Pay', 'assets/images/apple.png'),
              _buildPaymentOption('Stripe', 'assets/images/stripe.png'),
              _buildPaymentOption('Google Play', 'assets/images/google.png'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPaymentOption(String label, String image) {
    {
      return ListTile(
        leading: Image.asset(image, width: 30, height: 30),
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: AppFontsFamily.poppins,
            fontSize: AppFontSizes.body,
            color: Colors.black,
          ),
        ),
        trailing: Radio<String>(
          value: label,
          activeColor: AppColors.primaryColor,
          groupValue: _selectedPayment,
          onChanged: (value) {
            setState(() {
              _selectedPayment = value!;
            });
          },
        ),
      );
    }
  }
}
