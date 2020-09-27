import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';


Future Locate()async{
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();

  return _locationData;
  return MapController(
    location: LatLng(_locationData.latitude, _locationData.longitude)
  );

}