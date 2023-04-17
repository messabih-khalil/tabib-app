import 'dart:io';

import 'package:app/providers/auth.dart';
import 'package:app/screens/app_home.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:app/widgets/shared/input_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  Map<String, String> _authData = {
    "phoneNumber": '',
    "password": '',
  };

  void _showErrorDialog(String errMessage) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("An Error Occured!"),
              content: Text(errMessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  final _signinKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signinKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputLabel('Phone Number'),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Your Phone Number',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    validator: (value) {
                      if (value!.length > 9) {
                        return null;
                      }
                      return 'Enter Valid Phone Number';
                    },
                    onSaved: (value) {
                      _authData['phoneNumber'] = value.toString();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputLabel('Password'),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    validator: (value) {
                      if (value!.length > 7) {
                        return null;
                      }
                      return 'Enter Valid Password';
                    },
                    onSaved: (value) {
                      _authData['password'] = value.toString();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    _signinKey.currentState!.save();
                    if (_signinKey.currentState!.validate()) {
                      try {
                        await context.read<Auth>().signin(
                            _authData['phoneNumber'].toString(),
                            _authData['password'].toString());
                        Navigator.of(context).pushNamed(AppHome.route);
                      } on HttpException catch (error) {
                         _showErrorDialog(
                            error.toString().replaceAll('HttpException:', ''));
                      }
                    } else {
                      return;
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.mainDarkColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.mainDarkColor, width: 2)),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t Have Account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignupScreen.route);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: AppColors.mainDarkColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
