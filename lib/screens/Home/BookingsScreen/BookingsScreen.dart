import 'package:brogam/providers/bookingScreenProvider.dart';
import 'package:brogam/screens/Home/EventBookingScreens/BookingSuccessScreen/booking_success_screen.dart';
import 'package:brogam/screens/Home/ExploreScreen/ExploreScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/BottomNav/bottomnav.dart';
import '../../../widgets/CustomRoundContainer/custom_round_container.dart';
import '../../../widgets/CustomToggle/custom_toggle.dart';
import '../HomeScreen/home_screen.dart';
import '../Profile/ProfileDetails/ProfileDetails.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const BookingsScreen(),
    ProfileDetailsScreen(),
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bookingsProvider = Provider.of<Bookingscreenprovider>(context);

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Horizontal margin
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Bookings',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.poppins,
                      fontSize: AppFontSizes.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      // width: screenWidth * 0.7,
                      child: CustomToggle(
                        initialSelectedIndex:
                            bookingsProvider.selectedToggleIndex,
                        onTap: (int selectedIndex) {
                          bookingsProvider.updateSelectedToggle(selectedIndex);
                        },
                        labels: const ['Ongoing', 'Completed'],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'My Event Bookings',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.poppins,
                      fontSize: AppFontSizes.subtitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Booking List
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(
                          bottom: 80), // Extra padding for the floating nav
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6.0,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        "assets/images/card2.png",
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomRoundedContainer(
                                          height: screenHeight * 0.025,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 5),
                                          backgroundColor:
                                              AppColors.fill.withOpacity(1),
                                          radius: 25,
                                          child: Text(
                                            'Swimming',
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontsFamily.poppins,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.secondaryColor
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          "Swimming Competition",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: AppColors.black,
                                            fontFamily: AppFontsFamily.poppins,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_sharp,
                                              size: 18.0,
                                              color: AppColors.secondaryColor,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              "Florida",
                                              style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFontsFamily.poppins),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Icon(
                                              Icons.calendar_month,
                                              size: 18.0,
                                              color: AppColors.secondaryColor,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              "25 Dec, 24",
                                              style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFontsFamily.poppins),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          "8 Tickets",
                                          style: TextStyle(
                                              color: AppColors.secondaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  AppFontsFamily.poppins),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      bookingsProvider.selectedToggleIndex == 1
                                          ? MainAxisAlignment.center
                                          : MainAxisAlignment.spaceEvenly,
                                  children: [
                                    if (bookingsProvider.selectedToggleIndex ==
                                        0)
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                AppColors.CancelRed.withOpacity(
                                                    0.2),
                                          ),
                                          height: screenHeight * 0.05,
                                          width: screenWidth * 0.38,
                                          child: Center(
                                            child: Text(
                                              'Cancel Booking',
                                              style: TextStyle(
                                                color: AppColors.CancelRed,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                fontFamily:
                                                    AppFontsFamily.poppins,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookingSuccessScreen(
                                              isBooking: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.primaryColor,
                                        ),
                                        height: screenHeight * 0.05,
                                        width: bookingsProvider
                                                    .selectedToggleIndex ==
                                                1
                                            ? screenWidth * 0.85
                                            : screenWidth * 0.4,
                                        child: Center(
                                          child: Text(
                                            'View Ticket',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                              fontSize: 14.0,
                                              fontFamily:
                                                  AppFontsFamily.poppins,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Floating Bottom Navigation Bar without horizontal margin
            Positioned(
              left: 15,
              right: 15,
              bottom: 20,
              child: Bottomnav(
                currentIndex: _currentIndex,
                onItemSelected: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
