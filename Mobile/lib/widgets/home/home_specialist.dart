import 'package:app/utils/colors.dart';
import 'package:app/widgets/shared/speciality_card.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: GridView.builder(
            itemCount: 8,
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
        ),
       
      ],
    );
  }
}
