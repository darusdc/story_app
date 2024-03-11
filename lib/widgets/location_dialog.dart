import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class LocationSelectionDialog extends StatefulWidget {
  const LocationSelectionDialog({super.key});

  @override
  State<LocationSelectionDialog> createState() =>
      _LocationSelectionDialogState();
}

class _LocationSelectionDialogState extends State<LocationSelectionDialog> {
  final Completer<GoogleMapController> _controllerCompleter =
      Completer<GoogleMapController>();
  LatLng? _selectedLocation;
  LocationData? _currentLocation;
  Location locationService = Location();
  geo.Placemark? _selectedAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      _currentLocation = await locationService.getLocation();
    } catch (e) {
      print("Failed to get current location: $e");
    }

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> infoLocation = {
      "name": _selectedAddress?.name ?? "Unknown place",
      "street": _selectedAddress?.street ?? "Unknown street",
      'ward': _selectedAddress?.subAdministrativeArea ?? "Unknown ward",
      'subDistrict': _selectedAddress?.subLocality ?? "Unknown place",
      'city': _selectedAddress?.locality ?? "Unknown place",
      'province': _selectedAddress?.administrativeArea ?? "Unknown province",
      'country': _selectedAddress?.country ?? "Unknown country"
    };
    return AlertDialog(
      title: const Text('Select Location'),
      content: SizedBox(
        height: 330,
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: _currentLocation != null
                  ? GoogleMap(
                      onMapCreated: (GoogleMapController controller) {
                        _controllerCompleter.complete(controller);
                      },
                      initialCameraPosition: CameraPosition(
                        target: _currentLocation != null
                            ? LatLng(_currentLocation!.latitude!,
                                _currentLocation!.longitude!)
                            : const LatLng(0.0, 0.0),
                        zoom: 15,
                      ),
                      onTap: _handleMapTap,
                      markers: _selectedLocation != null
                          ? {
                              Marker(
                                markerId: const MarkerId("selectedLocation"),
                                position: _selectedLocation!,
                                infoWindow: InfoWindow(
                                    title: infoLocation['name'],
                                    snippet:
                                        '${infoLocation['street']}, ${infoLocation['ward']}, ${infoLocation['subDistrict']}, ${infoLocation['city']}, ${infoLocation['province']}, ${infoLocation['country']}'),
                              ),
                            }
                          // _markers
                          : {},
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      // liteModeEnabled: true,
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              infoLocation['name'] ?? "",
              overflow: TextOverflow.clip,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cancel location selection
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _selectedLocation != null
              ? _confirmLocation
              : null, // Confirm location only if selected
          child: const Text('Confirm'),
        ),
      ],
    );
  }

  void _handleMapTap(LatLng latLng) async {
    setState(() {
      _selectedLocation = latLng; // Update selected location on map tap
    });
    await _getAddressFromLatLng(latLng);
  }

  void _confirmLocation() {
    if (_selectedLocation != null) {
      Navigator.of(context)
          .pop(_selectedLocation); // Get address from selected location
    }
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<geo.Placemark> placemarks =
          await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks.isNotEmpty) {
        geo.Placemark place = placemarks[0];
        setState(() {
          _selectedAddress = place;
          // Update selected address
        });
      }
    } catch (e) {
      print("Failed to get address from coordinates: $e");
    }
  }
}
