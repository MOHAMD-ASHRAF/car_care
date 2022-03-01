import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SpareScreen extends StatelessWidget {
  const SpareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(backgroundColor: appPrimaryColor)),
      body: Center(
          child: Text('spare  will by Available Soon.....',
              style: TextStyle(fontSize: 20, color: Colors.grey))),
    );
  }
}
