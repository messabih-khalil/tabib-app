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
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        routes: {
          // '/': (context) => HomeScreen(),
          SigninScreen.route: (context) => SigninScreen(),
          SignupScreen.route: (context) => SignupScreen(),
          AppHome.route: (context) => AppHome(),
        },
      ),
    );
  }
}
