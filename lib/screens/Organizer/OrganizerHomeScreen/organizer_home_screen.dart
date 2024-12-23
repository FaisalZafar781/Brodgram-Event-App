import 'package:brogam/providers/HomeScreenProvider.dart';
import 'package:brogam/providers/OraganizerProvider/AddEventProvider.dart';
import 'package:brogam/screens/Home/ExploreScreen/ExploreScreen.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:brogam/screens/Organizer/OrganizerEventsScreen/AddEventPageBuilder/AddEventPageBuilder.dart';
import 'package:brogam/screens/Organizer/OrganizerEventsScreen/organizer_event_screen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brogam/widgets/VerticalEventCard/single_verticle_card.dart';
import 'package:brogam/widgets/Bell_IconHomeScreen/bell_icon.dart';
import '../../../providers/OraganizerProvider/organizer_home_screen_provider.dart';
import '../../../widgets/OrganizerBottomNav/organizer_bottom_nav.dart';
import '../../../widgets/TutorGrid/tutor_grid.dart';

class OrganizerHomeScreen extends StatefulWidget {
  const OrganizerHomeScreen({
    super.key,
  });

  @override
  State<OrganizerHomeScreen> createState() => _OrganizerHomeScreenState();
}

class _OrganizerHomeScreenState extends State<OrganizerHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const OrganizerHomeScreen(),
    const OrganizerEventScreen(),
    ProfileDetailsScreen(
      isOrganizer: true,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  void initState() {
    super.initState();
    final organizerHomeScreenProvider =
        Provider.of<OrganizerHomeScreenProvider>(context, listen: false);
    organizerHomeScreenProvider.fetchEventsProvider();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<OrganizerHomeScreenProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              SafeArea(
                child: value.loading == true
                    ? Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor))
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 36, 0, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.075,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location',
                                        style: TextStyle(
                                            fontFamily: AppFontsFamily.poppins,
                                            fontSize: AppFontSizes.small,
                                            color: AppColors.IconColors),
                                      ),
                                      SizedBox(height: screenHeight * 0.005),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: AppColors.black,
                                            size: AppFontSizes.body,
                                          ),
                                          SizedBox(width: screenWidth * 0.010),
                                          const Text(
                                            'New York, USA',
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontsFamily.poppins,
                                              fontSize: AppFontSizes.body,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.010),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppColors.black,
                                            size: AppFontSizes.title1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const BellIcon(),
                                ],
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Tutor DashBoard',
                                        style: TextStyle(
                                          fontFamily: AppFontsFamily.poppins,
                                          fontSize: AppFontSizes.title1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 20, 0),
                                      child: TutorGrid(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 15, 0),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Recent Events',
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontsFamily.poppins,
                                              fontSize: AppFontSizes.subtitle,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ExploreScreen()));
                                            },
                                            child: Text(
                                              'View all',
                                              style: TextStyle(
                                                fontFamily:
                                                    AppFontsFamily.poppins,
                                                fontSize: AppFontSizes.body,
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: value.events.length,
                                      itemBuilder: (context, index) {
                                        final event = value.events[index];
                                        return SingleVerticleCard(
                                          id: event.id,
                                          isOrganizer: true,
                                          sportsCategory: event.category ?? '',
                                          location: event.location ?? '',
                                          eventTitle: event.title ?? '',
                                          description: event.description ?? '',
                                          eventType: event.eventType ?? '',
                                          ticketPrice: event.price != null
                                              ? event.price.toString()
                                              : 'Free',
                                          isPaid: event.price != null &&
                                              event.price! > 0,
                                          startDate: event.date ?? 0,
                                          startTime: event.eventStartTime ?? 0,
                                          endTime: event.eventEndTime ?? 0,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              Positioned(
                bottom: 100.0,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Addeventpagebuilder(),
                            ));
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 15,
                  right: 15,
                  bottom: 20,
                  child: OrganizerBottomNav(
                    currentIndex: _currentIndex,
                    onItemSelected: _onItemTapped,
                  )),
            ],
          );
        },
      ),
    );
  }
}
