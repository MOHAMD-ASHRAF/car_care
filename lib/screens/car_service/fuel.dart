import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Fuel extends StatelessWidget {
  List<String> items = [
    'opel',
    'masr',
    'on the run',
    'misr',
    'watanya',
    'total',
    'car gas'
  ];
  List<String> balads = [
    'almoaskar',
    'gdela',
    'aldwran',
    'shbeen street',
    'sand station',
    'mw2af',
    'tanta street'
  ];
  List<String> numbers = [
    'mansoura',
    'cairo',
    'zayd',
    'ismailia',
    'fayoum',
    'geza',
    'tanta'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor,
        centerTitle: true,
        title: Text('Battery Charge'),
        leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: buildList(),
    );
  }

  Widget buildList() => ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final number = numbers[index];
        final balad = balads[index];
        return ListTile(
          leading: Icon(
            Icons.person,
            size: 45,
            color: appPrimaryColor,
          ),
          title: Text(
            item,
            style: TextStyle(fontSize: 20, color: appPrimaryColor),
          ),
          subtitle: Text(
            number,
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(
            balad,
            style: TextStyle(fontSize: 20),
          ),
        );
      });
}
