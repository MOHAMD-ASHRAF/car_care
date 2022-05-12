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





Widget defaultField2({
  required TextEditingController controller,
  required TextInputType typeOfInput,
  bool obscureText = false,
  Widget? preFix,
  required String text,
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
          labelText: text,
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





Widget information({
  required String text,
  required String describe,
}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text( '    $describe',
      style: TextStyle(fontSize: 20 , color: Colors.grey),),
    SizedBox(height: 5,),
    Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      width: double.infinity,
      height: 30,
      child: Text(text, style: TextStyle(fontSize: 15 , color: Colors.black , fontWeight: FontWeight.bold),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey),
      ),
    ),
  ],
);

