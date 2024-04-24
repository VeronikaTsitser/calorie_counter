extension DateTimeExtensions on DateTime {
  /// Возвращает DateTime на начало текущего дня (00:00:00)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }
}
