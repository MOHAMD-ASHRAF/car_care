import 'dart:collection';
import 'dart:math';

import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SpareDetails extends StatefulWidget {

  @override
  State<SpareDetails> createState() => _SpareDetailsState();
}
class _SpareDetailsState extends State<SpareDetails> {




 @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: appPrimaryColor,
        centerTitle: true,
        title: Text('hi, my maps'),
      ),
    );
  }
}
