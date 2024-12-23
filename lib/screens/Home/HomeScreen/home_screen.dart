import 'package:brogam/providers/HomeScreenProvider.dart';
import 'package:brogam/screens/Home/BookingsScreen/BookingsScreen.dart';
import 'package:brogam/screens/Home/ExploreScreen/ExploreScreen.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/HorizontalEventCard/horizontal_event_card.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import '../../../widgets/Bell_IconHomeScreen/bell_icon.dart';
import '../../../widgets/BottomNav/bottomnav.dart';
import '../../../widgets/Calender/calender.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<HomeScreenProvider>(builder: (context, value, child) {
          return Stack(
            children: [
              // Main body content, visible behind or above the bottom navigation
              Positioned.fill(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 36, 0, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.075,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontFamily: AppFontsFamily.poppins,
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

                        // Categories
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                            height: screenHeight * 0.05,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, bottom: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      value.setSelectedIndex(index);
                                    },
                                    child: CustomRoundedContainer(
                                      boxShadow: true,
                                      showBorder: true,
                                      backgroundColor:
                                          index == value.selectedIndex
                                              ? AppColors.secondaryColor
                                              : AppColors.white,
                                      radius: 12,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Swimming',
                                          style: TextStyle(
                                            fontFamily: AppFontsFamily.poppins,
                                            fontSize: AppFontSizes.body,
                                            color: index == value.selectedIndex
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

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Events Header: Featured
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Featured',
                                        style: TextStyle(
                                          fontFamily: AppFontsFamily.poppins,
                                          fontSize: AppFontSizes.subtitle,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'View all',
                                          style: TextStyle(
                                            fontFamily: AppFontsFamily.poppins,
                                            fontSize: AppFontSizes.body,
                                            color: AppColors.secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Horizontal Event Card
                                const HorizontalEventCard(),

                                // Events Header: Upcoming Events
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 15, 0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Upcoming Events',
                                        style: TextStyle(
                                          fontFamily: AppFontsFamily.poppins,
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
                                            fontFamily: AppFontsFamily.poppins,
                                            fontSize: AppFontSizes.body,
                                            color: AppColors.secondaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Vertical Event Card
                                VerticalEventCard(
                                  isOrganizer: false,
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

              // Bottom Navigation Bar
              Positioned(
                  left: 15,
                  right: 15,
                  bottom: 20, // Adjust height from bottom
                  child: Bottomnav(
                    currentIndex: _currentIndex,
                    onItemSelected: _onItemTapped,
                  )),
            ],
          );
        }));
  }

  void _openFilterDrawer(BuildContext context) {
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    double screenHeight = MediaQuery.of(context).size.height;
    double lowerValue = 50;
    double upperValue = 420;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Consumer<HomeScreenProvider>(
          builder:
              (BuildContext context, HomeScreenProvider value, Widget? child) {
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
                                // Main container for categories
                                Container(
                                  height: 60,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: AppColors.lighyGreyColor1),
                                  ),
                                  child: Row(
                                    children: [
                                      // Categories with scrollable row
                                      Expanded(
                                        child: homeScreenProvider
                                                .selectedItems.isEmpty
                                            ? const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Text(
                                                  "Select Categories", // Hint text
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14.0,
                                                      fontFamily: AppFontsFamily
                                                          .poppins),
                                                ),
                                              )
                                            : ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: homeScreenProvider
                                                    .selectedItems.length,
                                                itemBuilder: (context, index) {
                                                  final item =
                                                      homeScreenProvider
                                                          .selectedItems[index];
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.0),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 8.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          item,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 4.0),
                                                        IconButton(
                                                          icon: Icon(
                                                            CupertinoIcons
                                                                .clear_circled,
                                                            color:
                                                                AppColors.white,
                                                            size: 16.0,
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                          constraints:
                                                              const BoxConstraints(),
                                                          onPressed: () {
                                                            homeScreenProvider
                                                                .removeItem(
                                                                    item);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                      const SizedBox(
                                          width:
                                              8.0), // Add spacing between ListView and dropdown
                                      // Dropdown icon
                                      GestureDetector(
                                        onTap: () {
                                          homeScreenProvider.toggleDropdown();
                                        },
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Dropdown for unselected items
                                if (homeScreenProvider.isDropdownOpen)
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          color: AppColors.lighyGreyColor1),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          homeScreenProvider.items.map((item) {
                                        final isSelected = homeScreenProvider
                                            .selectedItems
                                            .contains(item);
                                        return InkWell(
                                          onTap: () {
                                            if (isSelected) {
                                              homeScreenProvider
                                                  .removeItem(item);
                                            } else {
                                              homeScreenProvider.addItem(item);
                                            }

                                            if (homeScreenProvider
                                                .selectedItems.isEmpty) {
                                              homeScreenProvider
                                                  .closeDropdown();
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2,
                                              horizontal: 8,
                                            ),
                                            child: Container(
                                              decoration: isSelected
                                                  ? BoxDecoration(
                                                      color: AppColors.fill,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    )
                                                  : null,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 12.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    item,
                                                    style: TextStyle(
                                                      fontFamily: AppFontsFamily
                                                          .poppins,
                                                      fontSize:
                                                          AppFontSizes.body,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: isSelected
                                                          ? Colors.black
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  if (isSelected)
                                                    CustomRoundedContainer(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      radius: 100,
                                                      backgroundColor: AppColors
                                                          .secondaryColor,
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
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: AppColors.lighyGreyColor1),
                            ),
                            child: Row(
                              children: [
                                CustomRoundedContainer(
                                  padding: const EdgeInsets.all(2),
                                  // borderWidth: 10,
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
                                    value: context
                                        .watch<HomeScreenProvider>()
                                        .selectedLocation,
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
                                    items: context
                                        .read<HomeScreenProvider>()
                                        .locationList
                                        .map((String location) {
                                      return DropdownMenuItem<String>(
                                        value: location,
                                        child: Text(location),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        context
                                            .read<HomeScreenProvider>()
                                            .updateSelectedLocation(newValue);
                                      }
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
                              onDragging:
                                  (handlerIndex, lowerValue, upperValue) {
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
                                  color:
                                      AppColors.secondaryColor.withOpacity(0.2),
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
      },
    );
  }
}
