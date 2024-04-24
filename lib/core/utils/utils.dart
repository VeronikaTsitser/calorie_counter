extension DateTimeExtensions on DateTime {
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get dateWeekAgo {
    return subtract(const Duration(days: 7));
  }

  DateTime get dateMonthAgo {
    return DateTime(year, month - 1, day);
  }
}
