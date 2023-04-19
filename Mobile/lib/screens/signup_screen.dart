import 'package:app/utils/spaces.dart';
import 'package:app/widgets/shared/pop_screen.dart';
import 'package:app/widgets/signup_screen_widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static const route = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: PopScreenWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.container),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Create Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SignupForm(),
            ],
          ),
        ));
  }
}
