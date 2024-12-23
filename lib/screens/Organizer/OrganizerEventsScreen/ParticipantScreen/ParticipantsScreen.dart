import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/PartticipantsTile/participants_tile.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:brogam/widgets/VerticalEventCard/single_verticle_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParticipantsScreen extends StatelessWidget {
  final bool isOrganizer;
  final String sportsCategory;
  final String location;
  final String eventTitle;
  final String description;
  final String eventType;
  final String ticketPrice;
  final int startTime;
  final bool isPaid;
  const ParticipantsScreen(
      {super.key,
      required this.isOrganizer,
      required this.sportsCategory,
      required this.location,
      required this.eventTitle,
      required this.description,
      required this.eventType,
      required this.ticketPrice,
      required this.isPaid,
      required this.startTime});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Participants',
            style: TextStyle(
                color: Colors.black,
                fontSize: AppFontSizes.subtitle,
                fontWeight: FontWeight.w600,
                fontFamily: AppFontsFamily.poppins)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: AppFontSizes.title1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Event',
              style: TextStyle(
                color: Colors.black,
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.subtitle,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            //Vertical event card

            SingleVerticleCard(
              startTime: startTime,
              isOrganizer: true,
              sportsCategory: sportsCategory,
              location: location,
              eventTitle: eventTitle,
              description: description,
              eventType: eventType,
              ticketPrice: ticketPrice,
              isPaid: true,
              startDate: startTime,
              endTime: startTime,

              ///change it to end time by pasing parameter from previous screen
            ),
            SizedBox(height: screenHeight * 0.020),
            const Text(
              'Participants (200)',
              style: TextStyle(
                color: Colors.black,
                fontSize: AppFontSizes.subtitle,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            //search bar
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: CustomField(
                hintText: "Search Participants",
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: (p0) {
                  return null;
                },
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            //Participants list
            const ParticipantsTile(
              length: 10,
            ),
          ],
        ),
      ),
    );
  }
}
