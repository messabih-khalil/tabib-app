import 'package:app/providers/auth.dart';
import 'package:app/screens/app_home.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (ctx) => Auth()),
      ],
      child: Consumer<Auth>(
        builder: (_, auth, __) => MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          title: 'Flutter Demo',
          home: auth.isAuth ? AppHome() : HomeScreen(),
          routes: {
            // '/': (context) => HomeScreen(),
            SigninScreen.route: (context) => SigninScreen(),
            SignupScreen.route: (context) => SignupScreen(),
            AppHome.route: (context) => AppHome(),
          },
        ),
      ),
    );
  }
}
