import 'package:brogam/services/Services/EventQueries/eventQueries.dart';
import 'package:flutter/material.dart';
import 'package:brogam/models/AddEventModel/add_event_model.dart';
import 'package:brogam/screens/Home/EventBookingScreens/EventDetailScreen/event_detail_screen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:intl/intl.dart';

class VerticalEventCard extends StatelessWidget {
  final bool isOrganizer;

  const VerticalEventCard({
    super.key,
    required this.isOrganizer,
  });

  Future<List<EventModel>> fetchEvents() async {
    EventQueries eventQueries = EventQueries();
    return await eventQueries.fetchEventsFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<List<EventModel>>(
      future: fetchEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No events found.'));
        }
        final events = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            children: events.map((event) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventDetailScreen(
                        id: event.id,
                        startTime: event.date!,
                        sportsCategory: event.category!,
                        location: event.location!,
                        eventTitle: event.title!,
                        desscription: event.description!,
                        eventype: event.eventType!,
                        tickerPrice: event.price?.toString() ?? '0',
                        isOrganizer: isOrganizer,
                        isPaid: event.isFree ?? false,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
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
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: AssetImage(events.indexOf(event) == 1 ||
                                        events.indexOf(event) == 2
                                    ? 'assets/images/card3.png'
                                    : 'assets/images/card2.png'),
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
                                  event.category ?? 'Category',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                event.title ?? 'Event Title',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    fontSize: AppFontSizes.body1,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                    letterSpacing: 0.5),
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
                                    event.location ?? 'Location',
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
                                    event.date != null
                                        ? DateFormat('dd MMM, yy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                event.date!),
                                          )
                                        : 'Date',
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
                                      text: '€${event.price ?? '0'}',
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
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
