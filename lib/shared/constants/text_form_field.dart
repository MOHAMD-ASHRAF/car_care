import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {required this.label,
      required this.boxHeight,
      required this.keyboardType});
  String label;
  double boxHeight;
  TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: boxHeight,
          child: TextFormField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
        )
      ],
    );
  }
}
