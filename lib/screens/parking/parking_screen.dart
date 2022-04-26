// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
//
//
// class ParkingScreen extends StatefulWidget {
//   const ParkingScreen({Key? key}) : super(key: key);
//
//   @override
//   _ParkingScreenState createState() => _ParkingScreenState();
// }
//
// class _ParkingScreenState extends State<ParkingScreen> {
//   GoogleMapController? _controller;
//   Location currentLocation = Location();
//   Set<Marker> _markers={};
//
//
//   void getLocation() async{
//     var location = await currentLocation.getLocation();
//     currentLocation.onLocationChanged.listen((LocationData loc){
//
//       _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//         target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
//         zoom: 12.0,
//       )));
//       print(loc.latitude);
//       print(loc.longitude);
//       setState(() {
//         _markers.add(Marker(markerId: MarkerId('Home'),
//             position: LatLng(loc.latitude ?? 0.0, loc.longitude  ?? 0.0)
//         ));
//       });
//     });
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     setState(() {
//       getLocation();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Map"),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child:GoogleMap(
//           zoomControlsEnabled: false,
//           initialCameraPosition:CameraPosition(
//             target: LatLng(48.8561, 2.2930),
//             zoom: 12.0,
//           ),
//           onMapCreated: (GoogleMapController controller){
//             _controller = controller;
//           },
//           markers: _markers,
//         ) ,
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.location_searching,color: Colors.white,),
//         onPressed: (){
//           getLocation();
//         },
//       ),
//     );
//   }
// }






import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../shared/constants/app_colors.dart';

class ParkingScreen extends StatefulWidget {

  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  var marker =HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (
          AppBar(backgroundColor: appPrimaryColor)),
      body: Stack(
        children: [
          const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14.4746),
              // onMapCreated: (GoogleMapController googleMapController){
              //   setState(() {
              //     marker.add(Marker(markerId: MarkerId()));
              //   });
              // }
          ),
          Container(
            child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,width: 100,height: 80,),
            alignment: Alignment.topRight,
          )
        ],
      ),
    );
  }
}