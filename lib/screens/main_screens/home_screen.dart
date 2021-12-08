
import 'package:car_care/shared/constants/app_colors.dart';
import 'package:car_care/shared/constants/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appPrimaryColor,
        title: Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.notifications_active_outlined),
        ],
      ),
    );
  }
}
