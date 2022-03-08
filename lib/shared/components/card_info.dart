
import 'package:flutter/material.dart';

Widget cardInfo({
  required String text,
  required IconData icon,
}) => Card(
color: Colors.white10,
child: ListTile(
leading: Icon(icon , color: Colors.white,),
title: Text(text,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,color: Colors.white),),
),
);