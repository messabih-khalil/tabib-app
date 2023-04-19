import 'package:app/utils/colors.dart';
import 'package:app/utils/spaces.dart';
import 'package:app/widgets/home_screen_widgets/all_specialist_button.dart';
import 'package:app/widgets/home_screen_widgets/home_specialist.dart';
import 'package:app/widgets/shared/doctor_card.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  static const route = '/app-home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tabib",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSpaces.container),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                // Header
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainDarkColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Specialist
                Text(
                  'Specialist',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                HomeCategories(),
                AllSpecialitiesButton(),
                SizedBox(
                  height: 5,
                ),

                SizedBox(
                  height: 15,
                ),
                // Doctors
                Text(
                  'Doctors',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                DoctorCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
