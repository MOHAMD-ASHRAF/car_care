import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CarPaint extends StatelessWidget {
  const CarPaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor,
        centerTitle: true,
        title: Text('Car Paint'),
        leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
