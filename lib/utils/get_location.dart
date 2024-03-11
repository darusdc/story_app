import 'package:geocoding/geocoding.dart';

Future<Placemark> getLocation(double lat, double long) async {
  var place = await placemarkFromCoordinates(lat, long);
  return place[0];
}
