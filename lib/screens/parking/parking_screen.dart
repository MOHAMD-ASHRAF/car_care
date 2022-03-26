import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../shared/constants/app_colors.dart';

class BarkingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (
          AppBar(backgroundColor: appPrimaryColor)),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746,
        )
      ),
    );
  }
}
