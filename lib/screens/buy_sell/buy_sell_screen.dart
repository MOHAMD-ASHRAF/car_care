import 'package:car_care/screens/buy_sell/car_details.dart';
import 'package:car_care/screens/recovery/recovery_screen.dart';
import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuySell extends StatelessWidget {
  final Uri _url = Uri.parse('https://google.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.add),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: appPrimaryColor,
        title: Text('Car Sharing'),
        centerTitle: true,
      )),
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: () {
              _launchUrl();
            },
            child: Text(
              'Need a ride ? \n just click !',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: appPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
