import 'package:flutter/material.dart';

import '../../services/Services/EventQueries/eventQueries.dart';

class EventDetailScreenProvider extends ChangeNotifier {
  final EventQueries eventQueries = EventQueries();
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  bool isLoading = false;

  Future<void> deleteEvent(String id) async {
    isLoading = true;
    notifyListeners();
    try {
      await eventQueries.deleteEvents(id);
    } catch (e) {
      print("Error while deleting event: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Update event
  Future<void> updateEvent(String id, Map<String, dynamic> updatedData) async {
    isLoading = true;
    notifyListeners();
    try {
      await eventQueries.updateEvent(id, updatedData);
    } catch (e) {
      print("Error while updating event: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

}
