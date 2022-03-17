import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SpareDetails extends StatelessWidget {
  const SpareDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: appPrimaryColor,
        centerTitle: true,
        title: Text('Product'),
      ),
      body: Column(),
    );
  }
}
