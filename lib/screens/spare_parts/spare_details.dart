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
 var markers =HashSet<Marker>();


 double calculateDistance(lat1, lon1, lat2, lon2){
   var p = 0.017453292519943295;
   var a = 0.5 - cos((lat2 - lat1) * p)/2 +
       cos(lat1 * p) * cos(lat2 * p) *
           (1 - cos((lon2 - lon1) * p))/2;
   return 12742 * asin(sqrt(a));
 }



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
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(27.6683619, 85.3101895),
            zoom: 11,),
        onMapCreated: (GoogleMapController googleMapController){
            setState((){
              markers.add(
                Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(27.6683619, 85.3101895),
                  infoWindow: InfoWindow(
                    title: 'my current location',
                    snippet: 'hego'
                  )
                ),
              );
              markers.add(
                Marker(
                  markerId: MarkerId('2'),
                  position: LatLng(28.6683618, 85.3101896),
                ),
              );
              markers.add(
                Marker(
                  markerId: MarkerId('3'),
                  position: LatLng(29.6683618, 85.3101896),
                ),
              );
              markers.add(
                Marker(
                  markerId: MarkerId('4'),
                  position: LatLng(29.6683618, 86.3101896),
                ),
              );
            });
        },
        markers: markers,
      ),
    );
  }
}
