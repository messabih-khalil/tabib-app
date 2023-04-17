import 'package:app/widgets/shared/pop_screen.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  static const route = '/app-home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopScreenWidget(),
      ),
      body: Container(
        child: Text("Home app"),
      ),
    );
  }
}
