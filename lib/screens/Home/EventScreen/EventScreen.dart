import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/Calender/calender.dart';
import 'package:brogam/widgets/CustomRoundContainer/custom_round_container.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import '../../../providers/LocationProvider.dart';
import '../../../widgets/BottomNav/bottomnav.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../../../widgets/HorizontalMapCard/horizontal_map_card.dart';
import '../BookingsScreen/BookingsScreen.dart';
import '../EventBookingScreens/EventDetailScreen/event_detail_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../Profile/ProfileDetails/ProfileDetails.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  // List<String> selectedCategories = [];
  List<String> items = [
    "Football",
    "Swimming",
    "Aerobics",
    "soccer",
    "Martial Arts",
  ];
  String selectedLocation = 'New York, USA'; // Default selected location
  final List<String> locations = [
    'New York, USA',
    'Los Angeles, USA',
    'Chicago, USA',
    'Houston, USA',
    'Miami, USA'
  ]; // List
  bool isDropdownOpen = false;
  List<String> selectedItems = [];

  DateTime selectedDate = DateTime(2024, 10, 2);
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();

  int _currentIndex = 1;

  final List<Widget> _screens = [
    const HomeScreen(),
    const EventScreen(),
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
  void initState() {
    super.initState();

    // Get the user's current location and move to it
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      locationProvider.getCurrentLocation(context).then((_) {
        _moveToCurrentLocation(locationProvider);
      });
    });
  }

  void _moveToCurrentLocation(LocationProvider locationProvider) {
    if (locationProvider.currentLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              locationProvider.currentLocation!.latitude!,
              locationProvider.currentLocation!.longitude!,
            ),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 10.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            markers: locationProvider.currentLocationMarker != null
                ? {locationProvider.currentLocationMarker!}
                : {},
          ),
          Positioned(
            bottom: 100.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // FloatingActionButton
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the value as needed
                      ),
                      onPressed: () {
                        locationProvider.getCurrentLocation(context).then((_) {
                          _moveToCurrentLocation(locationProvider);
                        });
                      },
                      child: const Icon(Icons.my_location),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: screenHeight * 0.32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Number of items in the horizontal list
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventDetailScreen(
                                      sportsCategory: "event.sportsCategory!",
                                      location: "event.location!",
                                      eventTitle: "event.eventTitle!",
                                      desscription: "event.aboutEvent!",
                                      eventype: "event.eventType!",
                                      tickerPrice: "event.ticketPrice!",
                                      isOrganizer: false,
                                      startTime: 123,
                                      isPaid: false,
                                        )));
                          },
                          child: const HorizontalMapCard());
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: CustomField(
              hintText: "Search",
              controller: _searchController,
              keyboardType: TextInputType.text,
              validator: (p0) {
                return null;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  _openFilterDrawer(context);
                },
                child: const Icon(
                  CupertinoIcons.slider_horizontal_3,
                ),
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Positioned(
              left: 15,
              right: 15,
              bottom: 20, // Adjust height from bottom
              child: Bottomnav(
                currentIndex: _currentIndex,
                onItemSelected: _onItemTapped,
              )),
        ],
      ),
    );
  }

//=========================================================================
  /// Open the filter drawer to apply filters
  void _openFilterDrawer(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double lowerValue = 50;
    double upperValue = 420;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.9,
            color: AppColors.screenBgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomRoundedContainer(
                    width: 150,
                    height: 5,
                    backgroundColor: AppColors.grey,
                    radius: 10,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Wrap content in ListView
                Expanded(
                  child: ListView(
                    children: [
                      // Category Section
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isDropdownOpen = !isDropdownOpen;
                                });
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 12, 15, 12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Wrap(
                                    children: [
                                      if (selectedItems.isEmpty)
                                        Row(
                                          children: [
                                            Text(
                                              'Select category',
                                              style: TextStyle(
                                                color: AppColors.grey,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Spacer(),
                                            Icon(
                                              Iconsax.arrow_down_1_copy,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        )
                                      else
                                        // Use a Row to arrange the chips and arrow horizontally
                                        Row(
                                          children: [
                                            // Horizontal scrolling for the selected items (chips)
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children:
                                                      selectedItems.map((item) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .secondaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    12.0,
                                                                vertical: 6.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              item,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    AppFontsFamily
                                                                        .poppins,
                                                                color: AppColors
                                                                    .white,
                                                                fontSize:
                                                                    AppFontSizes
                                                                        .body,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 8.0),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedItems
                                                                      .remove(
                                                                          item);
                                                                });
                                                              },
                                                              child:
                                                                  CustomRoundedContainer(
                                                                radius: 100,
                                                                borderColor:
                                                                    AppColors
                                                                        .white,
                                                                showBorder:
                                                                    true,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(2),
                                                                child: Icon(
                                                                  Icons.close,
                                                                  size: 12,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                            // Dropdown arrow, positioned at the end of the chips
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isDropdownOpen =
                                                      !isDropdownOpen;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Icon(
                                                  Iconsax.arrow_down_1_copy,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (isDropdownOpen)
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: AppColors.lighyGreyColor1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: items.map((item) {
                                    final isSelected =
                                        selectedItems.contains(item);
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            selectedItems.remove(item);
                                          } else {
                                            selectedItems.add(item);
                                          }
                                          if (selectedItems.isEmpty) {
                                            isDropdownOpen = false;
                                          }
                                          isDropdownOpen = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 8),
                                        child: Container(
                                          decoration: isSelected
                                              ? BoxDecoration(
                                                  color: AppColors.fill,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                )
                                              : null,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFontsFamily.poppins,
                                                  fontSize: AppFontSizes.body,
                                                  fontWeight: FontWeight.w500,
                                                  color: isSelected
                                                      ? Colors.black
                                                      : Colors.black,
                                                ),
                                              ),
                                              if (isSelected)
                                                CustomRoundedContainer(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  radius: 100,
                                                  backgroundColor:
                                                      AppColors.secondaryColor,
                                                  child: Icon(
                                                    Icons.check,
                                                    color: AppColors.white,
                                                    size: 15,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      // Location Section
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSizes.body,
                        ),
                      ),

                      // Dropdown for selecting location
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.lighyGreyColor1),
                        ),
                        child: Row(
                          children: [
                            CustomRoundedContainer(
                              padding: const EdgeInsets.all(2),
                              borderWidth: 10,
                              borderColor:
                                  AppColors.lightGreen.withOpacity(0.15),
                              radius: 8,
                              showBorder: true,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: DropdownButton<String>(
                                value: selectedLocation,
                                isExpanded: true,
                                underline: const SizedBox(),
                                icon: Icon(
                                  Iconsax.arrow_down_1_copy,
                                  color: AppColors.black,
                                ),
                                style: const TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                items: locations.map((String location) {
                                  return DropdownMenuItem<String>(
                                    value: location,
                                    child: Text(location),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedLocation = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.035),
                      // Event Price Section
                      Row(
                        children: [
                          const Text(
                            'Select price range',
                            style: TextStyle(
                              fontFamily: AppFontsFamily.poppins,
                              fontWeight: FontWeight.bold,
                              fontSize: AppFontSizes.body,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$${lowerValue.toStringAsFixed(0)}',
                            style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor),
                          ),
                          Text(
                            '-\$${upperValue.toStringAsFixed(0)}',
                            style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                        child: FlutterSlider(
                          values: const [100, 420],
                          rangeSlider: true,
                          max: 500,
                          min: 0,
                          onDragging: (handlerIndex, lowerValue, upperValue) {
                            lowerValue = lowerValue;
                            upperValue = upperValue;
                            setState(() {});
                          },
                          handler: FlutterSliderHandler(
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.secondaryColor,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_left,
                                  size: 16,
                                  color: AppColors.primaryColor,
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 16,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          rightHandler: FlutterSliderHandler(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.secondaryColor,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_left,
                                  size: 16,
                                  color: AppColors.primaryColor,
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  size: 16,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          trackBar: FlutterSliderTrackBar(
                            activeTrackBar: BoxDecoration(
                              color: AppColors
                                  .secondaryColor, // Color for the active part of the bar
                              borderRadius: BorderRadius.circular(4),
                            ),
                            inactiveTrackBar: BoxDecoration(
                              color: AppColors.secondaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      // Event Date Section
                      const Text(
                        'Event Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: AppFontsFamily.poppins,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      // Calendar
                      SizedBox(
                        height: screenHeight * 0.1,
                        child: const Calendar(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                // Buttons remain fixed at the bottom
                ActionButton(
                  text: 'Apply',
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {},
                  borderRadius: 20,
                  fontweight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                ActionButton(
                  text: 'Reset',
                  backgroundColor: AppColors.white,
                  textColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {},
                  borderRadius: 20,
                  fontweight: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
