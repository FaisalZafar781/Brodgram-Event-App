import 'package:flutter/material.dart';

class TicketCounterProvider with ChangeNotifier {
  int _ticketCount = 1;

  int get ticketCount => _ticketCount;

  void incrementTicket() {
    _ticketCount++;
    notifyListeners();
  }

  void decrementTicket() {
    if (_ticketCount > 1) {
      _ticketCount--;
      notifyListeners();
    }
  }
}
