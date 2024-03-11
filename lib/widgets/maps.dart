import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget showMaps(
    {required double lon,
    required double lat,
    required String name,
    required String snippet}) {
  return SizedBox(
    height: 300, // Adjust the height as needed
    child: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          lat,
          lon,
        ),
        zoom: 14,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('storyLocation'),
          position: LatLng(
            lat,
            lon,
          ),
          infoWindow: InfoWindow(
            title: name,
            snippet: snippet,
          ),
        ),
      },
    ),
  );
}
