import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class AllSpecialitiesButton extends StatelessWidget {
  const AllSpecialitiesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColors.mainDarkColor),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "See all",
            style: TextStyle(
                fontSize: 18,
                color: AppColors.mainDarkColor,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
