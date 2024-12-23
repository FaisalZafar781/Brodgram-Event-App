import 'package:brogam/screens/Home/EventBookingScreens/EventDetailScreen/event_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:intl/intl.dart';

class VerticalCardWithDate extends StatelessWidget {
  final String? id;
  final bool isOrganizer;
  final String sportsCategory;
  final String location;
  final String eventTitle;
  final String description;
  final String eventType;
  final String ticketPrice;
  final bool isPaid;
  final int startDate;
  final int startTime;
  final int endTime;

  const VerticalCardWithDate(
      {super.key,
      this.id,
      required this.isOrganizer,
      required this.sportsCategory,
      required this.location,
      required this.eventTitle,
      required this.description,
      required this.eventType,
      required this.ticketPrice,
      required this.isPaid,
      required this.startDate,
      required this.startTime,
      required this.endTime});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(
              id: id,
              startTime: startTime,
              startDate: startDate,
              endTime: endTime,
              sportsCategory: sportsCategory,
              location: location,
              eventTitle: eventTitle,
              desscription: description,
              eventype: eventType,
              tickerPrice: ticketPrice,
              isOrganizer: isOrganizer,
              isPaid: isPaid,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
          //   child: Text(
          //     'Events on ${DateFormat('dd MMM').format(
          //       DateTime.fromMillisecondsSinceEpoch(startDate),
          //     )}',
          //     style: TextStyle(
          //       fontFamily: AppFontsFamily.poppins,
          //       fontSize: AppFontSizes.subtitle,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10),
            child: CustomRoundedContainer(
              width: screenWidth,
              backgroundColor: AppColors.white,
              radius: 12,
              borderColor: AppColors.containerBorderColor,
              showBorder: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Container(
                      width: screenWidth * 0.32,
                      height: screenHeight * 0.12,
                      decoration: const BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/card2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRoundedContainer(
                          height: screenHeight * 0.025,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          backgroundColor: AppColors.fill.withOpacity(1),
                          radius: 25,
                          child: Text(
                            sportsCategory,
                            style: TextStyle(
                              fontFamily: AppFontsFamily.poppins,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          eventTitle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: AppFontsFamily.poppins,
                            fontSize: AppFontSizes.body1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.secondaryColor,
                              size: AppFontSizes.body,
                            ),
                            SizedBox(width: screenWidth * 0.010),
                            Text(
                              '$location, USA',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.small,
                                color: AppColors.IconColors,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.030),
                            Icon(
                              Icons.calendar_month,
                              color: AppColors.secondaryColor,
                              size: AppFontSizes.small,
                            ),
                            SizedBox(width: screenWidth * 0.010),
                            Text(
                              DateFormat('dd MMM, yy').format(
                                DateTime.fromMillisecondsSinceEpoch(startDate),
                              ),
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.small,
                                color: AppColors.IconColors,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '€$ticketPrice',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.body,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              TextSpan(
                                text: '/person',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.body,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
