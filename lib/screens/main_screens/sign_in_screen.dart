
import 'package:car_care/shared/constants/text_form_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                MyTextField(
                  boxHeight: 30,
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  boxHeight: 30,
                  keyboardType: TextInputType.visiblePassword,
                  label: 'Password',
                ),
                ListTile(
                  leading: Checkbox(
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
