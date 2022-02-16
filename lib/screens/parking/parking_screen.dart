import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
class BarkingScreen extends StatelessWidget {
  const BarkingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (
          AppBar(
            backgroundColor: appPrimaryColor
          )
      ),
      body: Center(
          child: Text(
              'parking  will by Available Soon.....' ,style: TextStyle(fontSize: 20, color: Colors.grey)
          )
      ),
    );
  }
}
