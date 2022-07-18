import 'package:car_care/screens/about_us/about_us_screen.dart';
import 'package:car_care/screens/car_service/batterycharge.dart';
import 'package:car_care/screens/car_service/carpaint.dart';
import 'package:car_care/screens/car_service/carwash.dart';
import 'package:car_care/screens/car_service/fuel.dart';
import 'package:car_care/screens/car_service/tyrecheck.dart';

import '../main_screens/home_screen.dart';
import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CarServices extends StatefulWidget {
  const CarServices({Key? key}) : super(key: key);

  @override
  State<CarServices> createState() => _CarServicesState();
}

class _CarServicesState extends State<CarServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context, HomeScreen());
            },
          ),
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Car Service',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [Icon(Icons.menu)],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(),
              color: appPrimaryColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView(
              physics: BouncingScrollPhysics(),
              children: [
                homeItem(
                    doit: CarWash(),
                    image: AssetImage('assets/images/fefedwdw.png'),
                    text: 'CAR WASH'),
                homeItem(
                    doit: BatterCharge(),
                    image: AssetImage('assets/images/fefe.png'),
                    text: 'Battery Charge'),
                homeItem(
                    doit: TyreCheck(),
                    image: AssetImage('assets/images/cece.png'),
                    text: 'TYRE CHECK'),
                homeItem(
                    doit: CarPaint(),
                    image: AssetImage('assets/images/11.png'),
                    text: 'CAR PAINTING'),
                homeItem(
                    doit: Fuel(),
                    image: AssetImage('assets/images/Untitled-8.png'),
                    text: 'FUEL'),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              )),
        ));
  }

  Widget homeItem({
    required AssetImage image,
    required String text,
    required Widget doit,
  }) =>
      InkWell(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => doit),
                  );
                },
                child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200],
                      border: Border.all(color: appPrimaryColor, width: 4)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image(
                      image: image,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ],
        ),
      );
}
