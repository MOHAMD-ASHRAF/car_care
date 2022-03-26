import 'package:car_care/screens/car_repair/car_repair_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/default_button.dart';
import '../../shared/constants/app_colors.dart';

class TypeOfRepair extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            buildItem(
                image: AssetImage('assets/images/motor.jpg'),
                text: 'motor',
                function: () {
                  navigateTo(context, CarRepairScreen());
                }),
            buildItem(
                image: AssetImage('assets/images/electronic.jpg'),
                text: 'electronic',
                function: () {
                  navigateTo(context, CarRepairScreen());
                }),
            buildItem(
                image: AssetImage('assets/images/car_inside.jpg'),
                text: 'inside',
                function: () {
                  navigateTo(context, CarRepairScreen());
                }),
          ],
        ),
      ),
    );
  }
}











Widget buildItem({
  required AssetImage image,
  required String text,
  GestureTapCallback? function}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: InkWell(
    onTap: function,
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: double.infinity,
          height:250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: appPrimaryColor, width: 2)
          ),
          child: Image(
            image: image ,fit: BoxFit.cover,
          ),
        ),
        Container(
            height: 50,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [appPrimaryColor,Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Center(
              child: Text(
                text,style: TextStyle(color: Colors.white,fontSize: 20)
                ,)
              ,)
        )
      ],
    ),
),
  );
