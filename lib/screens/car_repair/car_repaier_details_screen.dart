import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

class CarRepairDetailsScreen extends StatelessWidget {
  const CarRepairDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Car Repair',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          MaterialButton(
              minWidth: 10,
              height: 10,
              onPressed: (){
                //navigateTo(context, ProfileScreen());
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            color: appPrimaryColor,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage:NetworkImage('https://vid.alarabiya.net/images/2020/01/07/b2fd1b6e-2a72-4038-b86b-985993fd4479/b2fd1b6e-2a72-4038-b86b-985993fd4479_16x9_1200x676.png?width=1138',),
              ),
              SizedBox(height: 20,),
              Text(
                'mohamed ashraf',style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: appPrimaryColor),maxLines: 2,),
            ],
          ),
        ),
      )
    );
  }
}


