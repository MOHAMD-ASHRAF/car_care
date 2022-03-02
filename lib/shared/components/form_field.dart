import 'package:flutter/material.dart';

Widget defaultField({
  required TextEditingController controller,
  required double? width,
  bool obscureText = false,
  required TextInputType typeOfInput,
  Widget? preFix,
  IconData? suffix,
  ValueChanged<String>? onSubmitted,
  FormFieldValidator<String>? validate,
  VoidCallback? suffixPressed,
}) =>
    Container(
      width: width,
      height: 30,
      child: TextFormField(
        controller: controller,
        readOnly: false,
        keyboardType: typeOfInput,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefix: preFix,
            suffix: IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            )),
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
