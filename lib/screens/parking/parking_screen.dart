import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';



class Home extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<Home> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers={};


  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){
      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(markerId: MarkerId('Home'),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
          infoWindow: InfoWindow(
            title: 'current location'
          )
        ));
        _markers.add(Marker(markerId: MarkerId('2'),
            position: LatLng(31.094242, 33.744564),
            infoWindow: InfoWindow(
                title: 'cairo'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('3'),
            position: LatLng(31.126823, 33.787196),
            infoWindow: InfoWindow(
                title: 'parking 3'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('4'),
            position: LatLng( 31.137395, 33.786566),
            infoWindow: InfoWindow(
                title: 'parking 4'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('5'),
            position: LatLng( 31.136576, 33.774786),
            infoWindow: InfoWindow(
                title: 'parking 5'
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
        title: Text("Parking"),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition:CameraPosition(
                target: LatLng(30.033333, 31.233334),
                zoom: 11.0,
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