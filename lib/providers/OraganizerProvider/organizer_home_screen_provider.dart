import 'package:brogam/models/AddEventModel/add_event_model.dart';
import 'package:brogam/services/Services/EventQueries/eventQueries.dart';
import 'package:flutter/material.dart';

class OrganizerHomeScreenProvider with ChangeNotifier {
  List<EventModel> events = [];
  bool loading = false;

  Future<void> fetchEventsProvider() async {
    try {
      loading = true;
      notifyListeners();
      EventQueries eventQueries = EventQueries();
      events = await eventQueries.fetchEventsFromFirebase();
      events.sort((a, b) {
        int startTimeA = a.eventStartTime ?? 0;
        int startTimeB = b.eventStartTime ?? 0;
        return startTimeB.compareTo(startTimeA);
      });
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      print("Error fetching events: $e");
      notifyListeners();
    }
  }
}
