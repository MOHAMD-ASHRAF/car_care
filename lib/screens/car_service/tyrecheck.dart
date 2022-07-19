import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TyreCheck extends StatelessWidget {
  List<String> items = [
    'ahmed abo ziad',
    'abdo hassan',
    'ahmed fayd',
    'amr reda',
    'eslam alsayd',
    'adel nashat',
    'emad anas'
  ];
  List<String> numbers = [
    '010763485734',
    '015839283749',
    '012875765767',
    '010374658734',
    '010298452736',
    '015298374988',
    '015982792298'
  ];
  List<String> balads = [
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
