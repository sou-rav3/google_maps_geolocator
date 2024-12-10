import 'package:flutter/material.dart';
import 'package:google_maps/home_screens.dart';

void main(){
  runApp(const GoogleMapsApp());
}

class GoogleMapsApp extends StatelessWidget {
  const GoogleMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreens(),
    );
  }
}
