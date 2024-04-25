import 'package:flutter/material.dart';

class DashBoardFilterNotifier extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void setSelectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }
}
