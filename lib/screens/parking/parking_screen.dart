import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

class BarkingScreen extends StatelessWidget {

 var emailControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(backgroundColor: appPrimaryColor)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          controller: emailControler,
          decoration: InputDecoration(
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(16),
           ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),

      ),
    );
  }
}
