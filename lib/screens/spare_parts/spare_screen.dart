
import 'package:car_care/screens/spare_parts/spare_details.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

class SpareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f3),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Spare Screen',
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
              colors: [appPrimaryColor, secondColor],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),

      body: GridView(
        padding: EdgeInsets.all(10),
          children: [
            buildSpare(
              image: AssetImage('assets/images/part2.jpg'),
              name: 'gear',
              price: '200 LE'
            ),
            buildSpare(
              image: AssetImage('assets/images/part4.webp'),
                name: 'tires',
                price: '150 LE'
            ),
            buildSpare(
                image: AssetImage('assets/images/part0.jpg'),
                name: 'brake',
                price: '130 LE'
            ),
            buildSpare(
                image: AssetImage('assets/images/part 6.jpg'),
                name: 'gasoline filter',
                price: '50LE'
            ), buildSpare(
                image: AssetImage('assets/images/part 7.jpg'),
                name: 'dynamo',
                price: '250 LE'
            ),
            buildSpare(
                image: AssetImage('assets/images/part8.jpeg'),
                name: 'spark plugs',
                price: '35 LE'
            ),
            buildSpare(
                image: AssetImage('assets/images/part9.jpg'),
                name: 'motor',
                price: '2200 LE'
            ),

            buildSpare(
                image: AssetImage('assets/images/part5.png'),
                name: 'tires',
                price: '150 LE'
            ),
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            childAspectRatio: 0.90,
            crossAxisSpacing: 15,
          )
      ),
    );
  }

  Widget buildSpare({
    context,
    //index,
    required AssetImage image,
     required String name,
    required String price,
  }
  )=> Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 5,
        )
      ],
    ),
    child: Column(
      children: [
        Container(
          child: Image(
           image: image,
  ),
          height: 140,
        ),
        Text( name,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: secondColor),),
        SizedBox(height: 5,),
        Text(price ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
      ],
    ),
  );
}

