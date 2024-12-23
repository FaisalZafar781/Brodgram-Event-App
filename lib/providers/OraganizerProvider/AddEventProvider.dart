import 'package:brogam/models/AddEventModel/add_event_model.dart';
import 'package:brogam/services/Services/EventQueries/eventQueries.dart';
import 'package:flutter/material.dart';

class AddEventProvider with ChangeNotifier {
  List<EventModel> events = [];
  String eventTitle = '';
  String aboutEvent = '';
  String? location;
  String? eventType;
  String? sportsCategory;
  String ticketPrice = '';
  late DateTime? startDate;
  late DateTime? startTime;
  late DateTime? endTime;
  List<String> galleryImages = []; // Store image paths or URLs
  String? selectedImagePath; // New property to store the selected image path
  bool loading = false;
  // Error messages
  String? eventTitleError;
  String? aboutEventError;
  String? TicketPriceError;
  String? eventTypeError;
  String? sportsCategoryError;
  String? locationError;
  String? startDateError;
  String? startTimeError;
  String? endTimeError;

  // Update event title
  void setEventTitle(String title) {
    eventTitle = title;
    notifyListeners();
  }

  // Update event description
  void setAboutEvent(String description) {
    aboutEvent = description;
    notifyListeners();
  }

  // Update location
  void setLocation(String location) {
    this.location = location;
    notifyListeners();
  }

  // Update event type
  void setEventType(String type) {
    eventType = type;
    notifyListeners();
  }

  // Update sports category
  void setSportsCategory(String category) {
    sportsCategory = category;
    notifyListeners();
  }

  // Update ticket price
  void setTicketPrice(String price) {
    ticketPrice = price;
    notifyListeners();
  }

  // Update time and date
  void setDateTimeEpoch(
      int startDateMillis, int startTimeMillis, int endTimeMillis) {
    startDate = DateTime.fromMillisecondsSinceEpoch(startDateMillis);
    startTime = DateTime.fromMillisecondsSinceEpoch(startTimeMillis);
    endTime = DateTime.fromMillisecondsSinceEpoch(endTimeMillis);
    notifyListeners();
  }

  void setSelectedImagePath(String? imagePath) {
    selectedImagePath = imagePath;
    notifyListeners();
  }

  String? getSelectedImagePath() {
    return selectedImagePath;
  }

  void clearFields() {
    eventTitle = '';
    eventTitleError = null;
    aboutEvent = '';
    aboutEventError = null;
    location = null;
    locationError = null;
    eventType = null;
    eventTypeError = null;
    sportsCategory = null;
    sportsCategoryError = null;
    ticketPrice = '';
    TicketPriceError = null;
    startDate = null;
    startDateError = null;
    startTime = null;
    startTimeError = null;
    endTime = null;
    endTimeError = null;
    galleryImages.clear();
    selectedImagePath = null;
    notifyListeners();
  }

  void setValues({
    String? eventTitle,
    String? aboutEvent,
    String? location,
    String? eventType,
    String? sportsCategory,
    String? ticketPrice,
    DateTime? startDate,
    DateTime? startTime,
    DateTime? endTime,
    List<String>? galleryImages,
    String? selectedImagePath,
  }) {
    if (eventTitle != null) {
      this.eventTitle = eventTitle;
    }
    if (aboutEvent != null) {
      this.aboutEvent = aboutEvent;
    }
    if (location != null) {
      this.location = location;
    }
    if (eventType != null) {
      this.eventType = eventType;
    }
    if (sportsCategory != null) {
      this.sportsCategory = sportsCategory;
    }
    if (ticketPrice != null) {
      this.ticketPrice = ticketPrice;
    }
    this.startDate = startDate;
    this.startTime = startTime;
    this.endTime = endTime;
    if (galleryImages != null) {
      this.galleryImages = galleryImages;
    }
    this.selectedImagePath = selectedImagePath;
    print('Values set: $eventTitle, $startDate, $startTime, $endTime');
    notifyListeners();
  }

  // Validation logic
  bool validateAboutFields() {
    bool isValid = true;

    if (eventTitle == null || eventTitle!.isEmpty) {
      eventTitleError = "Event title is required";
      isValid = false;
    } else {
      eventTitleError = null;
    }

    if (aboutEvent == null || aboutEvent!.isEmpty) {
      aboutEventError = "About event is required";
      isValid = false;
    } else {
      aboutEventError = null;
    }

    if (ticketPrice == null || ticketPrice.isEmpty) {
      TicketPriceError = "Ticket Price is required";
      isValid = false;
    } else {
      TicketPriceError = null;
    }
    if (eventType == null || eventType!.isEmpty) {
      eventTypeError = "Please select an event type";
      isValid = false;
    } else {
      eventTypeError = null;
    }

    if (sportsCategory == null || sportsCategory!.isEmpty) {
      sportsCategoryError = "Please select a sports category";
      isValid = false;
    } else {
      sportsCategoryError = null;
    }
    if (location == null || location!.isEmpty) {
      locationError = "Please select a location";
      isValid = false;
    } else {
      locationError = null;
    }
    notifyListeners();
    return isValid;
  }

// Validation date time logic
  bool validateTimeFields() {
    bool isValid = true;

    if (startDate == null) {
      startDateError = "Please select a start date";
      isValid = false;
    } else {
      startDateError = null;
    }

    if (startTime == null) {
      startTimeError = "Please select a start time";
      isValid = false;
    } else {
      startTimeError = null;
    }

    if (endTime == null) {
      endTimeError = "Please select an end time";
      isValid = false;
    } else {
      endTimeError = null;
    }
    notifyListeners();
    return isValid;
  }

  // Method to save event to Firebase
  Future<void> saveEventToFirebase() async {
    try {
      EventModel event = EventModel(
        title: eventTitle,
        description: aboutEvent,
        location: location,
        eventType: eventType,
        category: sportsCategory,
        price: int.tryParse(ticketPrice),
        eventImages: selectedImagePath != null ? [selectedImagePath!] : [],
        date: startDate!.millisecondsSinceEpoch,
        eventStartTime: startTime!.millisecondsSinceEpoch,
        eventEndTime: endTime!.millisecondsSinceEpoch,
      );
      EventQueries addEvent = EventQueries();
      await addEvent.addNewEventToFirebase(event);

      notifyListeners();
      print("Event saved to Firebase successfully!");
    } catch (e) {
      loading = false;
      print("Error saving event: $e");
    }
  }
}
