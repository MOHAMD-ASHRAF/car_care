import 'package:car_care/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';



class ParkingScreen extends StatefulWidget {
  const ParkingScreen({Key? key}) : super(key: key);

  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {

  // void getLocation() async{-
  //   var location = await currentLocation.getLocation();
  //   currentLocation.onLocationChanged.listen((LocationData loc){
  //
  //     _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
  //       target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
  //       zoom: 12.0,
  //     )));
  //     print(loc.latitude);
  //     print(loc.longitude);
  //     setState(() {
  //       _markers.add(Marker(markerId: MarkerId('Home'),
  //           position: LatLng(loc.latitude ?? 0.0, loc.longitude  ?? 0.0)
  //       ));
  //     });
  //   });
   static const _initialCameraPosition =CameraPosition(
     target: LatLng(37.42796133580664, -122.085749655962),
     zoom: 14.5,
   );

    GoogleMapController? _googleMapController;
    TextEditingController? _searchController = TextEditingController();

    static final Marker _kGooglePlexMarker = Marker(
      markerId: const MarkerId(' _kGooglePlex'),
      infoWindow:  const InfoWindow(title: 'your location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(37.42796133580664, -122.085749655962),
    );

   static final Marker _destination = Marker(
     markerId: const MarkerId(' _destination'),
     infoWindow:  const InfoWindow(title: 'your destination'),
     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
     position: LatLng(37.43296265331129, -122.08832357078792),
   );
   static final Polyline _kPolyLine = Polyline(
     polylineId:  PolylineId('_kPolyLine'),
     points: [
        LatLng(37.42796133580664, -122.085749655962),
       LatLng(37.43296265331129, -122.08832357078792)
     ],
     width: 5,
   );
   static final Polygon _kPolygon = Polygon(
     polygonId:  PolygonId('_kPolygon'),
     points: [
       LatLng(37.42796133580664, -122.085749655962),
       LatLng(37.43296265331129, -122.08832357078792),
       LatLng(37.418, -122.092),
       LatLng(37.435, -122.092),
     ],
     strokeWidth: 5,
     fillColor: Colors.transparent,
   );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextFormField(
              controller:  _searchController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(hintText:  'search for parking'),
                onChanged: (value) {
                  print(value);
                },
              )
              ),
              IconButton(
                  onPressed: (){
                    LocationService().grtPlace(_searchController!.text);
                  },
                  icon: Icon(
                      Icons.search
                  ),
              )
            ],
          ),
          Expanded(
            child:GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition:_initialCameraPosition,
              onMapCreated: (controller) => _googleMapController =controller,
              markers: {
                _kGooglePlexMarker,
                // _destination,
              },
              // polylines: {
              //   _kPolyLine
              // },
              // polygons: {
              //   _kPolygon
              // },
            ) ,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.location_searching,color: Colors.white,),
        onPressed: () => _googleMapController!.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
      ),
    );
  }


   // void _addMarker(LatLng pos){
   //   if(_origin == null || (_origin != null && _destination != null)){
   //    setState(() {
   //      _origin =Marker(
   //        markerId: const MarkerId('origin'),
   //        infoWindow:  const InfoWindow(title: 'Origin'),
   //        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
   //        position: pos,
   //      );
   //     _destination = null;
   //
   //    });
   //   }else{
   //   _destination = Marker(
   //     markerId: const MarkerId('destination'),
   //     infoWindow:  const InfoWindow(title: 'Destination'),
   //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
   //     position: pos,
   //   );
   //   }
   // }
}







// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// import '../../shared/constants/app_colors.dart';

// class ParkingScreen extends StatefulWidget {
//
//   @override
//   State<ParkingScreen> createState() => _ParkingScreenState();
// }
//
// class _ParkingScreenState extends State<ParkingScreen> {
//   var myMarkers =HashSet<Marker>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: (
//           AppBar(backgroundColor: appPrimaryColor)),
//       body: Stack(
//         children: [
//            GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(37.42796133580664, -122.085749655962),
//                 zoom: 14.4746),
//               onMapCreated: (GoogleMapController googleMapController){
//                 setState(() {
//                   myMarkers.add(
//                       Marker(
//                           markerId: MarkerId('1'),
//                           position: LatLng(37.43296265331129, -122.08832357078792),
//                         infoWindow: InfoWindow(
//                           title: 'your location',
//                         ),
//                       ),
//                   );
//                 });
//               },
//              markers: myMarkers,
//              polygons: myPolygon(),
//           ),
//           Container(
//             child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,width: 100,height: 80,),
//             alignment: Alignment.topRight,
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
// Set<Polygon> myPolygon() {
//   List<LatLng> polygonCoords =  [];
//   polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));
//   polygonCoords.add(LatLng(37.43006265331129, -122.08832357078792));
//   polygonCoords.add(LatLng(37.43006265331129, -122.08332357078792));
//   polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));
//
//   var polygonSet = Set<Polygon>();
//   polygonSet.add(Polygon(
//       polygonId: PolygonId('1'),
//       points: polygonCoords,
//       strokeWidth: 1,
//       strokeColor: Colors.red)
//   );
//
//   return polygonSet;
// }




//
// import 'package:flutter/cupertino.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class ParkingScreen extends StatefulWidget {
//   @override
//   _MapState createState() => _MapState();
// }
//
// class _MapState extends State<ParkingScreen> {
//   late Completer<GoogleMapController> controller1;
//
//   //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
//   late LatLng _initialPosition;
//   final Set<Marker> _markers = {};
//   late   LatLng _lastMapPosition = _initialPosition;
//
//   @override
//   void initState() {
//     super.initState();
//     _getUserLocation();
//   }
//   void _getUserLocation() async {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
//     setState(() {
//       _initialPosition = LatLng(position.latitude, position.longitude);
//       print('${placemark[0].name}');
//     });
//   }
//
//
//   _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       controller1.complete(controller);
//     });
//   }
//
//   MapType _currentMapType = MapType.normal;
//
//   void _onMapTypeButtonPressed() {
//     setState(() {
//       _currentMapType = _currentMapType == MapType.normal
//           ? MapType.satellite
//           : MapType.normal;
//     });
//   }
//
//   _onCameraMove(CameraPosition position) {
//     _lastMapPosition = position.target;
//   }
//
//   _onAddMarkerButtonPressed() {
//     setState(() {
//       _markers.add(
//           Marker(
//               markerId: MarkerId(_lastMapPosition.toString()),
//               position: _lastMapPosition,
//               infoWindow: InfoWindow(
//                   title: "Pizza Parlour",
//                   snippet: "This is a snippet",
//                   onTap: (){
//                   }
//               ),
//               onTap: (){
//               },
//
//               icon: BitmapDescriptor.defaultMarker));
//     });
//   }
//   Widget mapButton(VoidCallback?  function, Icon icon, Color color) {
//     return RawMaterialButton(
//       onPressed: function,
//       child: icon,
//       shape: new CircleBorder(),
//       elevation: 2.0,
//       fillColor: color,
//       padding: const EdgeInsets.all(7.0),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _initialPosition == null ? Container(child: Center(child:Text('loading map..', style: TextStyle(fontFamily: 'Avenir-Medium', color: Colors.grey[400]),),),) : Container(
//         child: Stack(children: <Widget>[
//           GoogleMap(
//             markers: _markers,
//
//             mapType: _currentMapType,
//             initialCameraPosition: CameraPosition(
//               target: _initialPosition,
//               zoom: 14.4746,
//             ),
//             onMapCreated: _onMapCreated,
//             zoomGesturesEnabled: true,
//             onCameraMove: _onCameraMove,
//             myLocationEnabled: true,
//             compassEnabled: true,
//             myLocationButtonEnabled: false,
//
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: Container(
//                 margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
//                 child: Column(
//                   children: <Widget>[
//                     mapButton(_onAddMarkerButtonPressed,
//                         Icon(
//                             Icons.add_location
//                         ), Colors.blue),
//                     mapButton(
//                         _onMapTypeButtonPressed,
//                         Icon(
//                           IconData(0xf473,
//                               fontFamily: CupertinoIcons.iconFont,
//                               fontPackage: CupertinoIcons.iconFontPackage
//                           ),
//                         ),
//                         Colors.green),
//                   ],
//                 )),
//           )
//         ]),
//       ),
//     );
//   }
// }
//
