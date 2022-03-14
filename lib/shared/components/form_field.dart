import 'package:flutter/material.dart';

Widget defaultField({
  required TextEditingController controller,
  required TextInputType typeOfInput,
  bool obscureText = false,
  Widget? preFix,
  IconData? suffix,
  ValueChanged<String>? onSubmitted,
  FormFieldValidator<String>? validate,
  VoidCallback? suffixPressed,
}) =>
    Center(
      child: TextFormField(
        style: TextStyle(fontSize: 16),
        controller: controller,
        readOnly: false,
        keyboardType: typeOfInput,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          suffixIcon: suffix != null ?IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffix),
          ): null,
        ),
        onFieldSubmitted: onSubmitted,
        validator: validate,
      ),
    );

void navigateAndFinish(context ,widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) =>widget,
    ),
        (Route<dynamic>  route) => false
);
