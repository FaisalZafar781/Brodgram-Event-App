import 'package:brogam/providers/OraganizerProvider/AddEventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../services/constants/constants.dart';
import '../../../../providers/OraganizerProvider/EventTimeDateProvider.dart';

class EventTimeDateScreen extends StatefulWidget {
  final bool isEditMode;
  final Function(int? startDateMillis, int? startTimeMillis, int? endTimeMillis)
      onDateTimeSelected;

  const EventTimeDateScreen(
      {super.key, required this.onDateTimeSelected, required this.isEditMode});

  @override
  State<EventTimeDateScreen> createState() => _EventTimeDateScreenState();
}

class _EventTimeDateScreenState extends State<EventTimeDateScreen> {
  // Controllers for date and time fields
  late TextEditingController _dateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();

    // Set initial values if in edit mode
    if (widget.isEditMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final eventProvider =
            Provider.of<AddEventProvider>(context, listen: false);
        final provider =
            Provider.of<EventTimeDateProvider>(context, listen: false);

        provider.setDate(eventProvider.startDate);
        provider.setStartTime(
            TimeOfDay.fromDateTime(eventProvider.startTime ?? DateTime.now()));
        provider.setEndTime(
            TimeOfDay.fromDateTime(eventProvider.endTime ?? DateTime.now()));

        _updateTextFields(provider);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  // Helper to update text fields when provider values change
  void _updateTextFields(EventTimeDateProvider provider) {
    setState(() {
      _dateController.text = provider.selectedDate != null
          ? DateFormat('yyyy-MM-dd').format(provider.selectedDate!)
          : '';
      _startTimeController.text = provider.startTime?.format(context) ?? '';
      _endTimeController.text = provider.endTime?.format(context) ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final eventProvider = Provider.of<AddEventProvider>(context);

    return Consumer<EventTimeDateProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.020),
                // Title for selecting date
                Text(
                  'Select Event Date',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                // Custom Field for Date
                CustomField(
                  onTap: () async {
                    _showCalendarModal(context, provider);
                    _updateTextFields(provider);
                  },
                  controller: _dateController,
                  errorText: eventProvider.startDateError,
                  hintText: "Select Date",
                  keyboardType: TextInputType.none,
                  suffixIcon:
                      const Icon(Iconsax.calendar_1_copy, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.020),
                // Title for selecting start and end time
                Text(
                  'Select Start and End Time',
                  style: TextStyle(
                    fontFamily: AppFontsFamily.poppins,
                    fontSize: AppFontSizes.body,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Custom Field for Start Time
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: CustomField(
                        onTap: () async {
                          await _selectTime(context, provider, 'start');
                          _updateTextFields(provider);
                          _triggerOnDateTimeSelected(provider);
                        },
                        controller: _startTimeController,
                        hintText: "Start Time",
                        errorText: eventProvider.startTimeError,
                        keyboardType: TextInputType.none,
                        suffixIcon:
                            const Icon(Iconsax.clock_copy, color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Start time is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    // Custom Field for End Time
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: CustomField(
                        onTap: () async {
                          await _selectTime(context, provider, 'end');
                          _updateTextFields(provider);
                          _triggerOnDateTimeSelected(provider);
                        },
                        controller: _endTimeController,
                        hintText: "End Time",
                        errorText: eventProvider.endTimeError,
                        keyboardType: TextInputType.none,
                        suffixIcon:
                            const Icon(Iconsax.clock_copy, color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "End time is required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method to trigger onDateTimeSelected callback after date and times are selected
  void _triggerOnDateTimeSelected(EventTimeDateProvider provider) {
    if (provider.selectedDate != null &&
        provider.startTime != null &&
        provider.endTime != null) {
      // Convert selected date to milliseconds since epoch
      int startDateMillis = provider.selectedDate!.millisecondsSinceEpoch;

      // Convert start and end time to milliseconds
      int startTimeMillis = DateTime(
        provider.selectedDate!.year,
        provider.selectedDate!.month,
        provider.selectedDate!.day,
        provider.startTime?.hour ?? 0,
        provider.startTime?.minute ?? 0,
      ).millisecondsSinceEpoch;

      int endTimeMillis = DateTime(
        provider.selectedDate!.year,
        provider.selectedDate!.month,
        provider.selectedDate!.day,
        provider.endTime?.hour ?? 0,
        provider.endTime?.minute ?? 0,
      ).millisecondsSinceEpoch;

      // Pass milliseconds to the onDateTimeSelected callback
      widget.onDateTimeSelected(
        startDateMillis,
        startTimeMillis,
        endTimeMillis,
      );
    }
  }

  // Method to show calendar modal to select a date
  // Method to show calendar modal to select a date
  void _showCalendarModal(
      BuildContext context, EventTimeDateProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Date',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.containerBorderColor, width: 1),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day), // Ensure no past dates
                    lastDay: DateTime.utc(2100, 12, 31), // Future end limit
                    focusedDay: provider.selectedDate ?? DateTime.now(),
                    selectedDayPredicate: (day) {
                      return isSameDay(provider.selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (selectedDay.isBefore(DateTime.now())) {
                        // Prevent selecting past date
                        return;
                      }
                      provider.setDate(selectedDay);
                      _dateController.text = DateFormat('yyyy-MM-dd')
                          .format(selectedDay); // Update controller
                      Navigator.pop(context);
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      disabledDecoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// Method to select time (either start or end)
  Future<void> _selectTime(
      BuildContext context, EventTimeDateProvider provider, String type) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: type == 'start'
          ? provider.startTime ?? TimeOfDay.now()
          : provider.endTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (type == 'start') {
        provider.setStartTime(picked);
        _startTimeController.text = picked.format(context); // Update controller
      } else {
        provider.setEndTime(picked);
        _endTimeController.text = picked.format(context); // Update controller
      }
    }
  }
}
