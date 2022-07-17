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
        zoom: 13.90,
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
            position: LatLng(30.612007, 32.280596),
            infoWindow: InfoWindow(
                title: 'parking 5'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('6'),
            position: LatLng(30.623167, 32.270241),
            infoWindow: InfoWindow(
                title: 'parking 6'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('7'),
            position: LatLng(30.616968, 32.270431),
            infoWindow: InfoWindow(
                title: 'parking 5'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('8'),
            position: LatLng(30.622279, 32.272539),
            infoWindow: InfoWindow(
                title: 'parking 8'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('9'),
            position: LatLng(30.619010, 32.271419),
            infoWindow: InfoWindow(
                title: 'parking 9'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('10'),
            position: LatLng(30.622286, 32.266872),
            infoWindow: InfoWindow(
                title: 'parking 10'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('12'),
            position: LatLng(30.614998, 32.265974),
            infoWindow: InfoWindow(
                title: 'parking 12'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('13'),
            position: LatLng(30.614481, 32.270062),
            infoWindow: InfoWindow(
                title: 'parking 13'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('14'),
            position: LatLng(30.621978, 32.282218),
            infoWindow: InfoWindow(
                title: 'parking 14'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('15'),
            position: LatLng(30.613644, 32.263217),
            infoWindow: InfoWindow(
                title: 'parking 15'
            )
        ));
        _markers.add(Marker(markerId: MarkerId('16'),
            position: LatLng(30.619686, 32.281418),
            infoWindow: InfoWindow(
                title: 'parking 16'
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
                target: LatLng(30.619010, 32.271419),
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