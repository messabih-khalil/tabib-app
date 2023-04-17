import 'package:flutter/material.dart';

class PopScreenWidget extends StatelessWidget {
  const PopScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded));
  }
}
