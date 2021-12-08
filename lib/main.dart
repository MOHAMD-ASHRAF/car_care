import 'package:car_care/screens/login/login_screen.dart';
import 'package:car_care/screens/main_screens/creat_account_screen.dart';
import 'package:car_care/screens/main_screens/home_screen.dart';
import 'package:car_care/screens/main_screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
