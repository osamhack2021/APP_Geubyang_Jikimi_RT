import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'diet.dart';
import 'diet_utils.dart';

class DietTableMonthly extends StatefulWidget {
  const DietTableMonthly({Key? key}) : super(key: key);

  @override
  _DietTableMonthlyState createState() => _DietTableMonthlyState();
}

class _DietTableMonthlyState extends State<DietTableMonthly> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Future<List<Diet>> fetchDiet() async {
    final String response =
        await rootBundle.loadString('assets/data/diet_info_ATC_Oct.json');
    List list = jsonDecode(response)['DS_TB_MNDT_DATEBYMLSVC_ATC_OCT'];
    List<Diet> diets = list.map((e) => Diet.fromjson(e)).toList();
    return diets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('표준식단'),
      ),
      body: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) async {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
          List<Diet> dietList = await fetchDiet();
          Diet selectedDiet = dietList.firstWhere(
              (element) =>
                  isSameDay(DateTime.parse(element.dates), selectedDay),
              orElse: () {
            return Diet(
                dates: '0000-00-00',
                breakfast: '조식',
                lunch: '중식',
                dinner: '석식');
          });
          showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[                      
                      const Text: (selectedDiet.dates),
                      ListTile(
                        leading: const Text('조식'),
                        title: Text(
                          selectedDiet.breakfast,
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Text('중식'),
                        title: Text(
                          selectedDiet.lunch,
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Text('석식'),
                        title: Text(
                          selectedDiet.dinner,
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
