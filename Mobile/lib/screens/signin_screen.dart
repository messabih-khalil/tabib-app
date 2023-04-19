import 'package:app/utils/colors.dart';
import 'package:app/utils/spaces.dart';
import 'package:app/widgets/shared/pop_screen.dart';
import 'package:app/widgets/signin_screnn_widgets/signin_form.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static const route = '/signin';
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
                'Sign in',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcom enter your phone number \nand password to sign in ",
                style: TextStyle(
                    color: AppColors.lightGreyColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SigninForm(),
            ],
          ),
        ));
  }
}
