import 'package:brogam/providers/HomeScreenProvider.dart';
import 'package:brogam/providers/OraganizerProvider/AddEventProvider.dart';
import 'package:brogam/providers/OraganizerProvider/OrganizerEventScreenProvider.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/OrganizerBottomNav/organizer_bottom_nav.dart';
import 'package:brogam/widgets/VerticalEventCard/single_verticle_card.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_card_with_dates.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import '../OrganizerHomeScreen/organizer_home_screen.dart';
import 'AddEventPageBuilder/AddEventPageBuilder.dart';

class OrganizerEventScreen extends StatefulWidget {
  const OrganizerEventScreen({
    super.key,
  });

  @override
  State<OrganizerEventScreen> createState() => _OrganizerEventScreenState();
}

class _OrganizerEventScreenState extends State<OrganizerEventScreen> {
  int _currentIndex = 1;
  final TextEditingController _searchController = TextEditingController();

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
    // Navigate to the selected screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  List<String> category = ["Active Events", "Past Events"];

  @override
  // void initState() {
  //   super.initState();
  //   final eventProvider =
  //       Provider.of<OrganizerEventScreenProvider>(context, listen: false);
  //   eventProvider.fetchEventsProvider(); // Fetch events on initialization

  //   _searchController.addListener(() {
  //     final query = _searchController.text;
  //     eventProvider.searchEventsActive(query);
  //     eventProvider.searchEventsPast(query);
  //   });
  //   final provider = Provider.of<OrganizerEventScreenProvider>(context);

  //   final groupedEvents = provider.groupedEvents;
  // }
//
  void initState() {
    super.initState();

    // Use WidgetsBinding to call after the first frame is drawn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final eventProvider =
          Provider.of<OrganizerEventScreenProvider>(context, listen: false);
      eventProvider.fetchEventsProvider(); // Fetch events on initialization

      _searchController.addListener(() {
        final query = _searchController.text;
        eventProvider.searchEventsActive(query);
        eventProvider.searchEventsPast(query);
      });
    });
  }

//
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<OrganizerEventScreenProvider>(
            builder: (context, value, child) {
          return Stack(
            children: [
              value.loading == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : Positioned.fill(
                      child: SafeArea(
                        child: Padding(
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
                                        SizedBox(height: screenHeight * 0.005),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'My Events',
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontsFamily.poppins,
                                              fontSize: AppFontSizes.title1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Icon(Iconsax.calendar,
                                          color: AppColors.primaryColor),
                                    )
                                  ],
                                ),
                              ),

                              // Search Field
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: CustomField(
                                  hintText: "Search",
                                  controller: _searchController,
                                  keyboardType: TextInputType.text,
                                  validator: (p0) {
                                    return null;
                                  },
                                  prefixIcon: Icon(
                                    Iconsax.search_normal_1_copy,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),

                              // Categories
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                  height: screenHeight * 0.05,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: category.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: GestureDetector(
                                          onTap: () {
                                            value.setSelectedIndex(index);
                                          },
                                          child: CustomRoundedContainer(
                                            borderColor:
                                                AppColors.containerBorderColor,
                                            showBorder: true,
                                            backgroundColor:
                                                index == value.selectedIndex
                                                    ? AppColors.primaryColor
                                                    : AppColors.white,
                                            radius: 12,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Center(
                                              child: Text(
                                                category[index],
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFontsFamily.poppins,
                                                  fontSize: AppFontSizes.body,
                                                  color: index ==
                                                          value.selectedIndex
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              value.selectedIndex == 0
                                  ? Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Consumer<
                                                OrganizerEventScreenProvider>(
                                              builder: (context, eventProvider,
                                                  child) {
                                                final eventsToShow =
                                                    eventProvider
                                                        .searchResultsActive;

                                                if (eventProvider.loading) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }

                                                if (eventsToShow.isEmpty) {
                                                  return const Center(
                                                      child: Text(
                                                          'No upcoming events.'));
                                                }

                                                final groupedEvents =
                                                    eventProvider.groupedEvents;

                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      groupedEvents.keys.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final date = groupedEvents
                                                        .keys
                                                        .elementAt(index);
                                                    final eventsForDate =
                                                        groupedEvents[date]!;

                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Date Heading
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 15,
                                                                    bottom: 10),
                                                            child: Text(
                                                              'Events on $date',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    AppFontsFamily
                                                                        .poppins,
                                                                fontSize:
                                                                    AppFontSizes
                                                                        .subtitle,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          // Event Cards
                                                          ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                eventsForDate
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    eventIndex) {
                                                              final event =
                                                                  eventsForDate[
                                                                      eventIndex];
                                                              return VerticalCardWithDate(
                                                                id: event.id,
                                                                isOrganizer:
                                                                    true,
                                                                sportsCategory:
                                                                    event.category ??
                                                                        '',
                                                                location: event
                                                                        .location ??
                                                                    '',
                                                                eventTitle:
                                                                    event.title ??
                                                                        '',
                                                                description:
                                                                    event.description ??
                                                                        '',
                                                                eventType: event
                                                                        .eventType ??
                                                                    '',
                                                                ticketPrice: event
                                                                        .price
                                                                        ?.toString() ??
                                                                    'Free',
                                                                isPaid: event
                                                                            .price !=
                                                                        null &&
                                                                    event.price! >
                                                                        0,
                                                                startDate: event
                                                                        .date ??
                                                                    0,
                                                                startTime: event
                                                                        .eventStartTime ??
                                                                    0,
                                                                endTime: event
                                                                        .eventEndTime ??
                                                                    0,
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Consumer<
                                                OrganizerEventScreenProvider>(
                                              builder: (context, eventProvider,
                                                  child) {
                                                final eventsToShow =
                                                    eventProvider
                                                        .searchResultsPast;

                                                if (eventProvider.loading) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }

                                                if (eventsToShow.isEmpty) {
                                                  return const Center(
                                                      child: Text(
                                                          'No past events available.'));
                                                }

                                                final groupedEvents =
                                                    eventProvider.groupedEvents;

                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      groupedEvents.keys.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final date = groupedEvents
                                                        .keys
                                                        .elementAt(index);
                                                    final eventsForDate =
                                                        groupedEvents[date]!;

                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Date Heading
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 15,
                                                                    bottom: 10),
                                                            child: Text(
                                                              'Events on $date',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    AppFontsFamily
                                                                        .poppins,
                                                                fontSize:
                                                                    AppFontSizes
                                                                        .subtitle,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          // Event Cards
                                                          ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                eventsForDate
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    eventIndex) {
                                                              final event =
                                                                  eventsForDate[
                                                                      eventIndex];
                                                              return VerticalCardWithDate(
                                                                id: event.id,
                                                                isOrganizer:
                                                                    true,
                                                                sportsCategory:
                                                                    event.category ??
                                                                        '',
                                                                location: event
                                                                        .location ??
                                                                    '',
                                                                eventTitle:
                                                                    event.title ??
                                                                        '',
                                                                description:
                                                                    event.description ??
                                                                        '',
                                                                eventType: event
                                                                        .eventType ??
                                                                    '',
                                                                ticketPrice: event
                                                                        .price
                                                                        ?.toString() ??
                                                                    'Free',
                                                                isPaid: event
                                                                            .price !=
                                                                        null &&
                                                                    event.price! >
                                                                        0,
                                                                startDate: event
                                                                        .date ??
                                                                    0,
                                                                startTime: event
                                                                        .eventStartTime ??
                                                                    0,
                                                                endTime: event
                                                                        .eventEndTime ??
                                                                    0,
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
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
                    ),

              // // Bottom Navigation Bar
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
                  bottom: 20, // Adjust height from bottom
                  child: OrganizerBottomNav(
                    currentIndex: _currentIndex,
                    onItemSelected: _onItemTapped,
                  )),
            ],
          );
        }));
  }
}
