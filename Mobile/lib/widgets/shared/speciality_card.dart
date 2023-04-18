import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Opacity(
          opacity: 0.3,
          child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/45/45495.png'),
        ),
      ),
    );
  }
}
