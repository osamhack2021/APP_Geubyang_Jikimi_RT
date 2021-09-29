import 'package:app/diet_listview.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'diet_utils.dart';

class DietCalendarDaily extends StatefulWidget {
  const DietCalendarDaily({Key? key}) : super(key: key);

  @override
  _DietCalendarDailyState createState() => _DietCalendarDailyState();
}

class _DietCalendarDailyState extends State<DietCalendarDaily> {
  late final ValueNotifier<List<Diet>> _selectedDiets;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

@override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedDiets = ValueNotifier(_getDietsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedDiets.dispose();
    super.dispose();
  }

  List<Diet> _getDietsForDay(DateTime day) {
    // Implementation example
    return kDiets[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedDiets.value = _getDietsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('표준식단_월력형'),
      ),
      body: Column(
        children: [
          TableCalendar<Diet>(
            firstDay: _focusedDay,
            lastDay: _focusedDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: _getDietsForDay,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            onDaySelected: _onDaySelected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0,),
          Expanded(child: 
          ValueListenableBuilder<List<Diet>>(
            valueListenable: _selectedDiets,
            builder: (context, value, _) {
              return ListView.builder(itemCount: value.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        // ignore: avoid_print
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                );
              },);
            },
          )),
        ]
      )
    );
  }
}
