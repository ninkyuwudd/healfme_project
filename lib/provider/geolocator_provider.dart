
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class CurrentLocProvider with ChangeNotifier {
  var pslat;
  var pslong;

  getlocation()async{
    var status = await Permission.location.request();
  if (status.isGranted) {
    // Permission granted
    // Proceed with location-based operations
        Position posisi = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    print(posisi.latitude);
    pslat = posisi.latitude;
    pslong = posisi.longitude;
    print(pslat);
    print(pslong);
    notifyListeners();
  } else if (status.isDenied) {
    print("Denied");
    // Permission denied
    // Show a message or request the permission again
  } else if (status.isPermanentlyDenied) {
    print("Permanently denied");
    // Permission permanently denied
    // Open app settings to enable the permission manually
    await openAppSettings();
  }

  
  }
  
}