import 'package:flutter/material.dart';

Widget defaultField({

  required TextEditingController emailController,
  required double? width,
  bool isPassword = false,
  required  TextInputType typeOfInput,
  IconData? preFix,
  ValueChanged<String>? onSubmitted,
}) => Container(
  width: width,
  height: 30,
  child: TextField(
    controller: emailController,
    readOnly: false,
    keyboardType: typeOfInput,
    obscureText: isPassword,
    decoration: InputDecoration(
        prefix: Icon(preFix),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        )
    ),
    onSubmitted: onSubmitted,
  ),

);