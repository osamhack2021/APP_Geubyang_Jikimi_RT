import 'dart:collection';

import 'package:app/diet_listview.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kDiets = LinkedHashMap<DateTime, List<Diet>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kDietSource);

final _kDietSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
        item % 4 + 1,
        (index) => Diet(dates: '0', brft: '1', lunc: '2', dinr: '3'))
}..addAll({
    kToday: [
      Diet(dates: '0', brft: '1', lunc: '2', dinr: '3'),
      Diet(dates: '0', brft: '1', lunc: '2', dinr: '3'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);