import 'package:flutter/material.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:geolocator/geolocator.dart';
class Location{
  late double latitude;
  late double longitude;

  Future getCurrentLocation() async{
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      print(permission);
      if (permission == LocationPermission.denied) {
        LocationPermission permission = await Geolocator.requestPermission();
        print(permission);
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude=position.longitude;
      latitude=position.latitude;
    }
    catch(e){
      print(e);
    }
  }

}