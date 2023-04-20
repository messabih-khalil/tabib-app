import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final Function(String) onClick;

  TimePicker(this.onClick);
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 2,
        children: List.generate(21, (index) {
          final hour = 7 + index ~/ 2;
          final minute = index % 2 == 0 ? '00' : '30';
          final time = '$hour:$minute';
          final isSelected = time == selectedTime;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTime = time;
              });

              widget.onClick(selectedTime.toString());
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  time,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
