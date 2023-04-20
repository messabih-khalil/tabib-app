import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  final Function(String) onClick;
  HorizontalCalendar(this.onClick);
  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final List<DateTime> _days = List.generate(
      7, (index) => DateTime.now().add(Duration(days: index + 1)));
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        itemBuilder: (context, index) {
          final day = _days[index];
          final isSelected = day == _selectedDate;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = day;
              });
              widget.onClick(_selectedDate.toString());
            },
            child: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isSelected ? Colors.blue : Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  DateFormat('EEE').format(day),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
