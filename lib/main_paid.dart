import 'package:dstory_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(name: "paid", variables: {"isFree": false});

  return runApp(const MyApp());
}
