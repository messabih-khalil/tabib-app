import 'package:app/widgets/shared/speciality_card.dart';
import 'package:flutter/material.dart';

class SpecialitiesCards extends StatelessWidget {
  const SpecialitiesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height - AppBar().preferredSize.height,
      child: GridView.builder(
        itemCount: 14,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          // childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard();
        },
      ),
    );
  }
}
