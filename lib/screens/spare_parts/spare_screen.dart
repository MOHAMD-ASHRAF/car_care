import 'package:car_care/screens/spare_parts/spare_details.dart';
import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SpareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (
          AppBar(
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
          )
      ),
      body: buildGrid(),
    );
  }
}

Widget buildGrid() {
  return GridView.builder(
    padding: EdgeInsets.all(5),
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
              MaterialPageRoute(builder: (context) =>  SpareDetails()),
            );
          },
          child: buildCard());
    },
  );
}


Widget buildCard() {
  return Container(
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appPrimaryColor)
    ),
    child: Column(
      children: [
        Expanded(
          child: Image.asset('assets/images/car service.png'),
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


