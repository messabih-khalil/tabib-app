import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  String title;
  InputLabel(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey[700],
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
