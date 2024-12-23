import 'package:flutter/material.dart';

class EventTimeDateProvider with ChangeNotifier {
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? get startTime => _startTime;
  TimeOfDay? get endTime => _endTime;

  void setDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setStartTime(TimeOfDay? time) {
    _startTime = time;
    notifyListeners();
  }

  void setEndTime(TimeOfDay? time) {
    _endTime = time;
    notifyListeners();
  }
}
