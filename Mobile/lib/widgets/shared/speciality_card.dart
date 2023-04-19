import 'package:flutter/material.dart';

class SpecialityCard extends StatelessWidget {
  final Map? speciality;
  const SpecialityCard({this.speciality});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Opacity(
          opacity: 0.3,
          child: Image.network(speciality!['image']),
        ),
      ),
    );
  }
}
