import 'package:car_care/screens/car_repair/car_repair_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/default_button.dart';
import '../../shared/constants/app_colors.dart';
import 'list_of_car_repair/another.dart';
import 'list_of_car_repair/electronic.dart';
import 'list_of_car_repair/motor.dart';

class TypeOfRepair extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Select',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            gradient: LinearGradient(
              colors: [appPrimaryColor,Colors.teal],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            buildItem(
                image: AssetImage('assets/images/motor.jpg'),
                text: 'motor',
                function: () {
                  navigateTo(context, MotorRepairScreen ());
                }),
            buildItem(
                image: AssetImage('assets/images/electronic.jpg'),
                text: 'electronic',
                function: () {
                  navigateTo(context, ElectronicRepairScreen());
                }),
            buildItem(
                image: AssetImage('assets/images/car_inside.jpg'),
                text: 'Another',
                function: () {
                  navigateTo(context, AnotherRepairScreen());
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
    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
    child: InkWell(
    onTap: function,
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: double.infinity,
          height:240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: appPrimaryColor, width: 3)
          ),
          child: Image(
            image: image ,fit: BoxFit.cover,
          ),
        ),
        Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [appPrimaryColor,Colors.teal],
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
