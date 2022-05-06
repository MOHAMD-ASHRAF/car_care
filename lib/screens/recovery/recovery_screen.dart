import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';

class RecoveryScreen extends StatelessWidget {
 // const RecoveryScreen({Key? key}) : super(key: key);
  GoogleMapController? _googleMapController;
  TextEditingController? _searchController = TextEditingController();
  static const _initialCameraPosition =CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.5,
  );
  static final Marker _kGooglePlexMarker = Marker(
    markerId: const MarkerId(' _kGooglePlex'),
    infoWindow:  const InfoWindow(title: 'your location'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(37.42796133580664, -122.085749655962),
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
              IconButton(onPressed: (){}, icon: Icon(Icons.search)
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
}

