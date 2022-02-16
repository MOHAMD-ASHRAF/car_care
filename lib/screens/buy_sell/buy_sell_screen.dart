import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
class BuySellScreen extends StatelessWidget {
  const BuySellScreen({Key? key}) : super(key: key);

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
              'buy_sell will by Available Soon.....' ,style: TextStyle(fontSize: 20, color: Colors.grey)
          )
      ),
    );
  }
}
