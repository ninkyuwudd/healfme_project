
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocProvider with ChangeNotifier {
  var pslat;
  var pslong;

  getlocation()async{
    Position posisi = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    pslat = posisi.latitude;
    pslong = posisi.longitude;

    notifyListeners();
    

  }
  
}