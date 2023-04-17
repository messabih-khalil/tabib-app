import 'dart:io';

import 'package:app/providers/auth.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:app/widgets/shared/input_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _signupKey = GlobalKey<FormState>();

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

  Map<String, String> _authData = {
    "phoneNumber": '',
    "password": '',
  };

  // Errors messages

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signupKey,
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
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Phone Number',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    validator: (value) {
                      if (value!.length > 5) {
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
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    validator: (value) {
                      if (value!.length > 8) {
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
                InputLabel('Repeat Password'),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Repeate Your Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    validator: (value) {
                      if (value!.length > 8) {
                        return null;
                      }
                      return 'Enter Valid Password';
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    _signupKey.currentState!.save();
                    if (_signupKey.currentState!.validate()) {
                      try {
                        await context.read<Auth>().signup(
                            _authData['phoneNumber'].toString(),
                            _authData['password'].toString());
                        Navigator.of(context).pushNamed(SigninScreen.route);
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
                      "Sign Up",
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
                    Text("I Have Account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SigninScreen.route);
                      },
                      child: Text(
                        "Sign in",
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
