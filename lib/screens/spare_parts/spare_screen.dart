import 'package:car_care/screens/spare_parts/spare_details.dart';
import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SpareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: appPrimaryColor,
        title: Text('Car Parts'),
        centerTitle: true,
      )),
      body: buildGrid(),
    );
  }
}

Widget buildGrid() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
    ),
    itemCount: 20,
    itemBuilder: (context, index) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SpareDetails()),
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
        Expanded(
          child: Image.asset('assets/images/Untitled-4.png'),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'part name',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'part description',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
                Text('50 l.e'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
