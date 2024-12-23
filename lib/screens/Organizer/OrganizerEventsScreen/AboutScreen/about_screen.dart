import 'package:brogam/providers/OraganizerProvider/AddEventProvider.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomDropDown/custom_drop_down.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatefulWidget {
  final String? eventTitle;
  final String? aboutEvent;
  final String? eventType;
  final String? location;
  final String? sportsCategory;
  final String? ticketPrice;

  const AboutScreen({
    Key? key,
    this.eventTitle,
    this.aboutEvent,
    this.eventType,
    this.location,
    this.sportsCategory,
    this.ticketPrice,
  }) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late TextEditingController eventTitleController;
  late TextEditingController eventDescriptionController;
  late TextEditingController ticketPriceController;

  @override
  void initState() {
    super.initState();
    eventTitleController = TextEditingController(text: widget.eventTitle);
    eventDescriptionController = TextEditingController(text: widget.aboutEvent);
    ticketPriceController = TextEditingController(text: widget.ticketPrice);

    final eventProvider = Provider.of<AddEventProvider>(context, listen: false);

    eventProvider.setEventTitle(eventTitleController.text);
    eventProvider.setAboutEvent(eventDescriptionController.text);
    eventProvider.setTicketPrice(ticketPriceController.text);
    if (widget.location != null) {
      eventProvider.setLocation(widget.location!);
    }
    if (widget.eventType != null) {
      eventProvider.setEventType(widget.eventType!);
    }
    if (widget.sportsCategory != null) {
      eventProvider.setSportsCategory(widget.sportsCategory!);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final eventProvider = Provider.of<AddEventProvider>(context, listen: false);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.020),
          // Event Title
          _buildLabel('Event Title'),
          SizedBox(height: screenHeight * 0.005),
          CustomField(
            controller: eventTitleController,
            hintText: 'Enter Event Title',
            hintTextColor: AppColors.IconColors,
            keyboardType: TextInputType.text,
            fillColor: AppColors.textFiledColor,
            borderColor: AppColors.lighyGreyColor1,
            errorText: eventProvider.eventTitleError,
            onChanged: (p0) {
              eventProvider.setEventTitle(p0);
            },
            validator: (String? String) {
              if (String?.isEmpty ?? true) {
                return 'Please enter event title';
              }
              return null;
            },
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter event title';
            //   }
            //   return null;
            // },
          ),
          SizedBox(height: screenHeight * 0.020),

          // Event Description
          _buildLabel('About Event'),
          SizedBox(height: screenHeight * 0.005),
          CustomField(
            height: screenHeight * 0.15,
            maxLine: 200,
            controller: eventDescriptionController,
            hintText: 'Write Event Description',
            hintTextColor: AppColors.IconColors,
            keyboardType: TextInputType.multiline,
            fillColor: AppColors.textFiledColor,
            borderColor: AppColors.lighyGreyColor1,
            errorText: eventProvider.aboutEventError,
            onChanged: (p0) {
              eventProvider.setAboutEvent(p0);
            },
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'Please enter event description';
              // }
              // return null;
            },
          ),
          SizedBox(height: screenHeight * 0.020),

          // Location Dropdown
          _buildLabel('Location'),
          SizedBox(height: screenHeight * 0.005),
          CustomDropdownField(
            value:
                Provider.of<AddEventProvider>(context, listen: false).location,
            hintText: "Location",
            errorText: eventProvider.locationError,
            items: const [
              "Las Vegas",
              "Brooklyn",
              "Florida",
              "Miami",
            ],
            onChanged: (value) {
              Provider.of<AddEventProvider>(context, listen: false)
                  .setLocation(value ?? '');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a location';
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.020),

          // Event Type Dropdown
          _buildLabel('Event Type'),
          SizedBox(height: screenHeight * 0.005),
          CustomDropdownField(
            value:
                Provider.of<AddEventProvider>(context, listen: false).eventType,
            hintText: "Select Type",
            items: const ["Physical Competition", "Online Competition"],
            errorText: eventProvider.eventTypeError,
            onChanged: (value) {
              Provider.of<AddEventProvider>(context, listen: false)
                  .setEventType(value ?? '');
            },
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'Please select event type';
              // }
              // return null;
            },
          ),
          SizedBox(height: screenHeight * 0.020),

          // Sports Category Dropdown
          _buildLabel('Sports Category'),
          SizedBox(height: screenHeight * 0.005),
          CustomDropdownField(
            value: Provider.of<AddEventProvider>(context, listen: false)
                .sportsCategory,
            hintText: "Select Category",
            errorText: eventProvider.sportsCategoryError,
            items: const [
              "Soccer",
              "Swimming",
              "Football",
              "Aerobics",
              "Martial Arts",
            ],
            onChanged: (value) {
              Provider.of<AddEventProvider>(context, listen: false)
                  .setSportsCategory(value ?? '');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select category';
              }
              return null;
            },
          ),
          SizedBox(height: screenHeight * 0.020),

          // Ticket Price
          _buildLabel('Ticket Price (per person)'),
          SizedBox(height: screenHeight * 0.005),
          CustomField(
            controller: ticketPriceController,
            hintText: '00.00',
            hintTextColor: AppColors.IconColors,
            keyboardType: TextInputType.number,
            fillColor: AppColors.textFiledColor,
            errorText: eventProvider.TicketPriceError,
            prefixIcon: Icon(
              Icons.monetization_on_outlined,
              color: AppColors.black,
            ),
            borderColor: AppColors.lighyGreyColor1,
            onChanged: (p0) {
              eventProvider.setTicketPrice(p0);
            },
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'Please enter price even if it is 0.0';
              // }
              // return null;
            },
          ),
          SizedBox(height: screenHeight * 0.030),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: AppFontsFamily.poppins,
        fontSize: AppFontSizes.body,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
