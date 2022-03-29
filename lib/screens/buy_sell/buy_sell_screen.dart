import 'package:car_care/screens/buy_sell/car_details.dart';
import 'package:car_care/screens/spare_parts/spare_details.dart';
import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BuySell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.add),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: appPrimaryColor,
        title: Text('Buy & Sell'),
        centerTitle: true,
      )),
      body: buildGrid(),
    );
  }
}

Widget buildGrid() {
  return ListView.builder(
    padding: EdgeInsets.all(5),
    itemCount: 20,
    itemBuilder: (context, index) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarDetails()),
            );
          },
          child: buildCard());
    },
  );
}

Widget buildCard() {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    child: Column(
      children: [
        Container(
          child: Image.asset('assets/images/Untitled-4.png'),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'car model',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'owner place',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('selling price'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
