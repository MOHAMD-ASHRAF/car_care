
import 'package:car_care/screens/main_screens/home_screen.dart';
import 'package:car_care/shared/constants/app_colors.dart';
import 'package:car_care/shared/constants/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarServices extends StatelessWidget {
  const CarServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: MaterialButton(minWidth: 20,
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context,HomeScreen());
            },
            child: Image(
                image: AssetImage('assets/back buttom.png'),
                fit: BoxFit.cover,
            ),
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
          actions: [
            Icon(Icons.menu)
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) ,bottomRight: Radius.circular(20)),
              color: appPrimaryColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView(
              physics: BouncingScrollPhysics(),
              children: [
                homeItem(image: AssetImage('assets/fefedwdw.png'), text: 'CAR WASH'),
                homeItem(image: AssetImage('assets/fefe.png'), text: 'Battery Charge'),
                homeItem(image: AssetImage('assets/cece.png'), text: 'TYRE CHECK'),
                homeItem(image: AssetImage('assets/11.png'), text: 'CAR PAINTING'),
                homeItem(image: AssetImage('assets/Untitled-8.png'), text: 'FUEL'),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 20,
              )
          ),
        )
    );
  }
  Widget homeItem(
      {
        required AssetImage image,
        required String text,
      }
      ) => InkWell(
    onTap: (){},
    child: Column(
      children: [
        Expanded(
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
                border: Border.all(color: appPrimaryColor,width: 4)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image(
                image: image,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(text ,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
        ),
      ],
    ),
  );
}