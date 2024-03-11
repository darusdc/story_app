import 'package:dstory_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
      name: "free",
      color: Colors.red,
      location: BannerLocation.topStart,
      variables: {"isFree": true});

  return runApp(const MyApp());
}
