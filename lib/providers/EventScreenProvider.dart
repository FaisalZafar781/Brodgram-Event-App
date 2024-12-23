import 'package:flutter/foundation.dart';

class EventscreenProvider extends ChangeNotifier {
  bool _isDropdownOpen = false;
  final List<String> _selectedItems = [];
  String _selectedLocation = 'New York, USA'; // Default location
  final List<String> _items = [
    "Football",
    "Swimming",
    "Aerobics",
    "Soccer",
    "Martial Arts",
  ];
  final List<String> locations = [
    'New York, USA',
    'Los Angeles, USA',
    'Chicago, USA',
    'Houston, USA',
    'Miami, USA'
  ];

  // Getters
  bool get isDropdownOpen => _isDropdownOpen;
  List<String> get selectedItems => _selectedItems;
  List<String> get items => _items;
  String get selectedLocation => _selectedLocation;
  List<String> get locationList => locations;

  // Methods
  void toggleDropdown() {
    _isDropdownOpen = !_isDropdownOpen;
    notifyListeners();
  }

  void addItem(String item) {
    if (!_selectedItems.contains(item)) {
      _selectedItems.add(item);
      notifyListeners();
    }
  }

  void removeItem(String item) {
    _selectedItems.remove(item);
    notifyListeners();
  }

  void closeDropdown() {
    _isDropdownOpen = false;
    notifyListeners();
  }

  void updateSelectedLocation(String newLocation) {
    _selectedLocation = newLocation;
    notifyListeners();
  }
}
