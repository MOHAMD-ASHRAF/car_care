import 'package:flutter/material.dart';

Widget defaultButton({
  required double width,
  required Color color,
  required Color colorText,
  required String text,
  VoidCallback? function,

})=> Container(
  width: width,
  height: 30,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(7),
  ),
  child: MaterialButton(
      onPressed: function,
      child: Text(text,
          style: TextStyle(color: colorText , fontWeight: FontWeight.bold , fontSize: 16)
      )
  ),
);

void navigateTo(context , widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>widget,
  ),
);
