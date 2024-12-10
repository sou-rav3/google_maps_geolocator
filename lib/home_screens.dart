import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          zoom: 16,
          target: LatLng(23.756902067260487, 90.36142403727027),
        ),
        onTap: (LatLng? latLng) {
          print(latLng);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        trafficEnabled: true,
        markers: <Marker>{
          const Marker(
            markerId: MarkerId('initial-position'),
            position: LatLng(23.756902067260487, 90.36142403727027),
          )
        },
        circles: <Circle>{
          Circle(
              circleId: CircleId('initial-circle'),
              fillColor: Colors.red,
              center: LatLng(23.756902067260487, 90.36142403727027),
              radius: 30,
              strokeColor: Colors.blue,
              strokeWidth: 2,
              visible: true,
              onTap: () {
                print('Entered into Dengue zone');
              })
        },
        polylines: <Polyline>{
          Polyline(
              polylineId: PolylineId('Random'),
              color: Colors.amber,
              width: 2,
              jointType: JointType.round,
              points: <LatLng>[
                LatLng(23.76990186425691, 90.36850407004535),
                LatLng(23.757254731705693, 90.36807491659141),
                LatLng(23.74397784820643, 90.37245228182157),
              ])
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 17,
                target: LatLng(23.756902067260487, 90.36142403727027),
              ),
            ),
          );
        },
        child: const Icon(Icons.location_history),
      ),
    );
  }
}
