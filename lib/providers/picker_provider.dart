import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PickerProvider extends ChangeNotifier {
  XFile? imageFile;
  String? imageFilePath;
  LatLng? location;
  geo.Placemark? locationLabel;

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }

  void setImagePath(String path) {
    imageFilePath = path;
    notifyListeners();
  }

  void setLocation(LatLng location_) async {
    location = location_;
    var place = await geo.placemarkFromCoordinates(
        location_.latitude, location_.longitude);
    locationLabel = place[0];
    notifyListeners();
  }
}
