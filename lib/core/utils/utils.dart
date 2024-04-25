import 'package:intl/intl.dart';

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

String formatDateTime(DateTime date) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime aDate = DateTime(date.year, date.month, date.day);

  if (aDate == today) {
    return 'Сегодня';
  }
  if (aDate == today.subtract(const Duration(days: 1))) {
    return 'Вчера';
  }
  if (aDate.year != today.year) {
    return DateFormat('d MMMM y', 'ru_RU').format(date);
  } else {
    return DateFormat('d MMMM', 'ru_RU').format(date);
  }
}
