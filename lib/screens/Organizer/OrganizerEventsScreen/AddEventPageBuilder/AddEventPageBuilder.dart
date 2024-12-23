import 'dart:io';
import 'package:brogam/providers/OraganizerProvider/AddEventProvider.dart';
import 'package:brogam/providers/OraganizerProvider/EventDetailScreenProvider.dart';
import 'package:brogam/providers/OraganizerProvider/EventTimeDateProvider.dart';
import 'package:brogam/screens/Home/EventBookingScreens/EventDetailScreen/event_detail_screen.dart';
import 'package:brogam/screens/Organizer/OrganizerEventsScreen/EventSuccessScreen/event_success_screen.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_stepper/easy_stepper.dart';
import '../../../../providers/OraganizerProvider/EventPageBuilderProvider.dart';
import '../../../../services/constants/constants.dart';
import '../AboutScreen/about_screen.dart';
import '../EventTimeDateScreen/event_time_date_screen.dart';
import '../GalleryScreen/gallery_screen.dart';

class Addeventpagebuilder extends StatefulWidget {
  final String? id;
  final String? eventTitle;
  final String? aboutEvent;
  final String? eventType;
  final String? location;
  final String? sportsCategory;
  final String? ticketPrice;
  final DateTime? startDate;
  final DateTime? startTime;
  final DateTime? endTime;

  const Addeventpagebuilder({
    super.key,
    this.eventTitle,
    this.aboutEvent,
    this.eventType,
    this.location,
    this.sportsCategory,
    this.ticketPrice,
    this.id,
    this.startDate,
    this.startTime,
    this.endTime,
  });

  @override
  State<Addeventpagebuilder> createState() => _AddeventpagebuilderState();
}

class _AddeventpagebuilderState extends State<Addeventpagebuilder> {
  final PageController _pageController = PageController();
  final List<String> _galleryImages = []; // Temporary storage for gallery data
  String _startDate = ''; // Temporary storage for start date
  String _startTime = '';
  String _endTime = '';

  @override
  void initState() {
    super.initState();
    final eventProvider = Provider.of<AddEventProvider>(context, listen: false);
    eventProvider.setValues(
      eventTitle: widget.eventTitle,
      aboutEvent: widget.aboutEvent,
      eventType: widget.eventType,
      location: widget.location,
      sportsCategory: widget.sportsCategory,
      ticketPrice: widget.ticketPrice,
      startDate: widget.startDate,
      startTime: widget.startTime,
      endTime: widget.endTime,
    );
  }

  @override
  void dispose() {
    super.dispose();
    final pageViewProvider =
        Provider.of<EventPageBuilderProvider>(context, listen: false);
    pageViewProvider.setCurrentIndex(0);
    final eventProvider = Provider.of<AddEventProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    final pageViewProvider = Provider.of<EventPageBuilderProvider>(context);
    final eventProvider = Provider.of<AddEventProvider>(context);
    final eventDetailProvider = Provider.of<EventDetailScreenProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (pageViewProvider.currentIndex > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              pageViewProvider
                  .setCurrentIndex(pageViewProvider.currentIndex - 1);
            } else {
              Navigator.pop(context);
              eventProvider.clearFields();
            }
          },
        ),
        title: const Text(
          "Add Event",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          EasyStepper(
            activeStep: pageViewProvider.currentIndex,
            unreachedStepTextColor: AppColors.lighyGreyColor1,
            activeStepBorderColor: AppColors.secondaryColor,
            activeStepBorderType: BorderType.normal,
            finishedStepBorderColor: AppColors.secondaryColor,
            finishedStepBackgroundColor: AppColors.secondaryColor,
            finishedStepIconColor: Colors.white,
            activeStepIconColor: AppColors.secondaryColor,
            unreachedStepBorderType: BorderType.normal,
            lineStyle: LineStyle(
                lineType: LineType.normal,
                lineThickness: 3,
                lineSpace: 1,
                lineWidth: 10,
                lineLength: 60,
                unreachedLineType: LineType.normal,
                unreachedLineColor: AppColors.lighyGreyColor1,
                finishedLineColor: AppColors.secondaryColor,
                activeLineColor: AppColors.lighyGreyColor1),
            internalPadding: 10,
            stepBorderRadius: 15,
            borderThickness: 2,
            activeStepTextColor: AppColors.primaryColor,
            finishedStepTextColor: AppColors.primaryColor,
            showLoadingAnimation: false,
            activeStepBackgroundColor: AppColors.white,
            enableStepTapping: false,
            steppingEnabled: true,
            stepRadius: 20.0,
            showStepBorder: true,
            steps: List.generate(3, (index) {
              return EasyStep(
                icon: (index == pageViewProvider.currentIndex)
                    ? const Icon(Icons.circle, color: Colors.green)
                    : (index < pageViewProvider.currentIndex)
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Icon(Icons.circle, color: Colors.grey),
                customTitle: Center(
                  child: Text(
                    index == 0
                        ? 'About'
                        : index == 1
                            ? 'Gallery'
                            : 'Time & Date',
                    style: TextStyle(
                        fontFamily: AppFontsFamily.poppins,
                        fontWeight: index == pageViewProvider.currentIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: index == pageViewProvider.currentIndex
                            ? AppColors.primaryColor
                            : AppColors.primaryColor),
                  ),
                ),
              );
            }),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                pageViewProvider.setCurrentIndex(index);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // AboutScreen, no change needed here as it already interacts with EventProvider
                  return AboutScreen(
                    eventTitle: eventProvider.eventTitle,
                    aboutEvent: eventProvider.aboutEvent,
                    eventType: eventProvider.eventType,
                    location: eventProvider.location,
                    sportsCategory: eventProvider.sportsCategory,
                    ticketPrice: eventProvider.ticketPrice,
                  );
                } else if (index == 1) {
                  // GalleryScreen, to handle image data
                  return GalleryScreen(onImageDataSubmitted: (imagePath, link) {
                    // Handle the selected image and link here
                    if (imagePath != null) {
                      _galleryImages.clear();
                      _galleryImages.add(imagePath); // Add the image file path
                    }
                  });
                } else if (index == 2) {
                  // Initialize EventTimeDateProvider with existing data (or empty if new event)
                  final dateProvider = Provider.of<EventTimeDateProvider>(
                      context,
                      listen: false);

                  // Update the provider with values from eventProvider only if editing an event
                  if (widget.id != null) {
                    dateProvider.setDate(eventProvider.startDate);
                    dateProvider.setStartTime(TimeOfDay.fromDateTime(
                        eventProvider.startTime ?? DateTime.now()));
                    dateProvider.setEndTime(TimeOfDay.fromDateTime(
                        eventProvider.endTime ?? DateTime.now()));
                  } else {
                    // If it's a new event, leave fields empty
                    dateProvider.setDate(null);
                    dateProvider.setStartTime(null);
                    dateProvider.setEndTime(null);
                  }

                  // EventTimeDateScreen to handle date and time selection
                  return EventTimeDateScreen(
                    isEditMode: widget.id !=
                        null, // Pass whether the page is in edit mode
                    onDateTimeSelected: (startDate, startTime, endTime) {
                      if (startDate != null &&
                          startTime != null &&
                          endTime != null) {
                        // Convert startDate (in milliseconds) back to DateTime
                        DateTime startDateTime =
                            DateTime.fromMillisecondsSinceEpoch(startDate);
                        DateTime startTimeDateTime =
                            DateTime.fromMillisecondsSinceEpoch(startTime);
                        DateTime endTimeDateTime =
                            DateTime.fromMillisecondsSinceEpoch(endTime);

                        int startTimeMillis = DateTime(
                          startDateTime.year,
                          startDateTime.month,
                          startDateTime.day,
                          startTimeDateTime.hour,
                          startTimeDateTime.minute,
                        ).millisecondsSinceEpoch;

                        int endTimeMillis = DateTime(
                          startDateTime.year,
                          startDateTime.month,
                          startDateTime.day,
                          endTimeDateTime.hour,
                          endTimeDateTime.minute,
                        ).millisecondsSinceEpoch;

                        // Update the eventProvider with selected date and time
                        eventProvider.setDateTimeEpoch(
                            startDate, startTimeMillis, endTimeMillis);
                      }
                    },
                  );
                }
                return Container(); // Default case
              },
            ),
          ),
          ActionButton(
            text: pageViewProvider.currentIndex == 2
                ? widget.id != null
                    ? 'Update Event'
                    : 'Add Event' // Check if id is passed
                : 'Next',
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.white,
            borderColor: AppColors.primaryColor,
            onPressed: () {
              if (pageViewProvider.currentIndex == 0) {
                // No need to manually set values here because `AboutScreen` already updates `EventProvider`
                // Validate AboutScreen fields
                if (!eventProvider.validateAboutFields()) {
                  // Show validation errors on AboutScreen
                  return;
                }
              }

              // If we are on the EventTimeDateScreen and there's valid date and time
              if (_startDate.isNotEmpty &&
                  _startTime.isNotEmpty &&
                  _endTime.isNotEmpty) {
                // Ensure the date and time values are set in the EventProvider
                eventProvider.setDateTimeEpoch(int.parse(_startDate),
                    int.parse(_startTime), int.parse(_endTime));
              }

              // Navigate to the next screen or save event on the last screen
              if (pageViewProvider.currentIndex < 2) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                pageViewProvider
                    .setCurrentIndex(pageViewProvider.currentIndex + 1);
              } else if (pageViewProvider.currentIndex == 2) {
                // Validate AboutScreen fields
                if (!eventProvider.validateTimeFields()) {
                  return;
                }
                if (widget.id != null) {
                  // Convert DateTime objects to millisecond
                  int? startDateEpoch = eventProvider.startDate != null
                      ? eventProvider.startDate!.millisecondsSinceEpoch
                      : null;
                  int? startTimeEpoch = eventProvider.startTime != null
                      ? eventProvider.startTime!.millisecondsSinceEpoch
                      : null;
                  int? endTimeEpoch = eventProvider.endTime != null
                      ? eventProvider.endTime!.millisecondsSinceEpoch
                      : null;

                  // Prepare the data to be updated
                  Map<String, dynamic> updatedData = {
                    'eventTitle': eventProvider.eventTitle,
                    'aboutEvent': eventProvider.aboutEvent,
                    'eventType': eventProvider.eventType,
                    'location': eventProvider.location,
                    'sportsCategory': eventProvider.sportsCategory,
                    'ticketPrice': eventProvider.ticketPrice,
                    'startDate': startDateEpoch, // Use the epoch milliseconds
                    'startTime': startTimeEpoch, // Use the epoch milliseconds
                    'endTime': endTimeEpoch, // Use the epoch milliseconds
                  };

                  // Call the update method on the eventDetailScreenProvider
                  eventDetailProvider.updateEvent(widget.id!, updatedData);
                  eventProvider.clearFields();
                } else {
                  // Save the event if id is not passed (Add new event)
                  eventProvider.saveEventToFirebase();
                  eventProvider.clearFields();
                }
                eventProvider.clearFields();
                pageViewProvider.setCurrentIndex(0);
                _pageController.jumpToPage(0);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventSuccessScreen(),
                  ),
                );
              }
            },
            buttonWidth: screenWidth * 0.9,
            borderRadius: 25,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
