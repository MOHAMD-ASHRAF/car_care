import 'package:flutter/material.dart';

Widget defaultField({
  required TextEditingController emailController,
  required double? width,
  bool obscureText = false,
  required  TextInputType typeOfInput,
  Widget? preFix,
  Widget? suffix,
  ValueChanged<String>? onSubmitted,
}) => Container(
  width: width,
  height: 30,
  child: TextField(
    controller: emailController,
    readOnly: false,
    keyboardType: typeOfInput,
    obscureText: obscureText,
    decoration: InputDecoration(
        prefix: preFix,
        suffix: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        )
    ),
    onSubmitted: onSubmitted,
  ),

);