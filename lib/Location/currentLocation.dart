//import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<dynamic> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
