import 'package:app/utils/spaces.dart';
import 'package:app/widgets/specialities_screen_widgets/render_specialites.dart';
import 'package:flutter/material.dart';

class SpecialitiesScreen extends StatelessWidget {
  static const route = '/specialities';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Specialist",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpaces.container,
        ),
        child: SpecialitiesCards(),
      ),
    );
  }
}
