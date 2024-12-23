import 'package:brogam/models/AddEventModel/add_event_model.dart';
import 'package:brogam/services/Services/EventQueries/eventQueries.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrganizerEventScreenProvider with ChangeNotifier {
  List<EventModel> events = [];
  List<EventModel> activeEvents = [];
  List<EventModel> pastEvents = [];
  List<EventModel> searchResultsActive = [];
  List<EventModel> searchResultsPast = [];
  late DateTime? startDate;
  late DateTime? startTime;
  late DateTime? endTime;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  String searchQuery = '';

  bool loading = false;
//New variable to store grouped events
  Map<String, List<EventModel>> groupedEvents = {};

//
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setDateTimeEpoch(
      int startDateMillis, int startTimeMillis, int endTimeMillis) {
    startDate = DateTime.fromMillisecondsSinceEpoch(startDateMillis);
    startTime = DateTime.fromMillisecondsSinceEpoch(startTimeMillis);
    endTime = DateTime.fromMillisecondsSinceEpoch(endTimeMillis);
    notifyListeners();
  }

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
      _categorizeEvents();
      searchResultsActive = [
        ...activeEvents,
      ];
      searchResultsPast = [
        ...pastEvents,
      ];

      // Group events by date
      _groupEventsByDate();

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      print("Error fetching events: $e");

      notifyListeners();
    }
  }

  void _categorizeEvents() {
    final now = DateTime.now();

    activeEvents = events.where((event) {
      final eventStartMillis = event.date ?? 0;
      return eventStartMillis > now.millisecondsSinceEpoch;
    }).toList();

    pastEvents = events.where((event) {
      final eventStartMillis = event.date ?? 0;
      return eventStartMillis < now.millisecondsSinceEpoch;
    }).toList();
  }

  void searchEventsActive(String query) {
    if (query.isEmpty) {
      searchResultsActive = [...activeEvents];
    } else {
      searchResultsActive = [...activeEvents].where((event) {
        return event.title?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();
    }
    notifyListeners();
  }

  void searchEventsPast(String query) {
    if (query.isEmpty) {
      searchResultsPast = [...pastEvents];
    } else {
      searchResultsPast = [...pastEvents].where((event) {
        return event.title?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();
    }
    notifyListeners();
  }

  void _groupEventsByDate() {
    Map<String, List<EventModel>> tempGroupedEvents = {};

    for (var event in events) {
      String formattedDate = DateFormat('dd MMM yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(event.date ?? 0),
      );

      if (tempGroupedEvents[formattedDate] == null) {
        tempGroupedEvents[formattedDate] = [];
      }
      tempGroupedEvents[formattedDate]!.add(event);
    }

    groupedEvents = tempGroupedEvents;
  }
}
