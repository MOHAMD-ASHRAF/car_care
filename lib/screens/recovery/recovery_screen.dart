import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';



class RecoveryScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<RecoveryScreen> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers={};


  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){
      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(30.620868, 32.281418),
        zoom: 13.90,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        ));
        _markers.add(Marker(markerId: MarkerId('8'),
            position: LatLng(30.610817, 32.258071),
            infoWindow: InfoWindow(
                title: 'Auto repair workshop'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('9'),
            position: LatLng(30.614679, 32.278846),
            infoWindow: InfoWindow(
                title: 'Auto repair workshop2'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('10'),
            position: LatLng(30.606110, 32.272288),
            infoWindow: InfoWindow(
                title: 'electronic'
            )
        ));
      });
    });
  }

  @override
  void initState(){
    super.initState();
    setState(() {
       getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Car Recovery")),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition:CameraPosition(
                target: LatLng(30.619010, 32.271419),
                zoom: 11,
              ),
              onMapCreated: (GoogleMapController controller){
                _controller = controller;
              },
              markers: _markers,
            ) ,
          ),
          Positioned(
            top: 25,
            right: 25,
            child: FloatingActionButton(
              child: Icon(Icons.location_searching,color: Colors.white,),
              onPressed: (){
                getLocation();
              },
            ),
          ),
        ],
      ),
    );
  }
}