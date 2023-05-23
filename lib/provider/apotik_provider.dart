

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApotekProvider extends ChangeNotifier {
  List _apoteklist = [];
  List get apotek => _apoteklist;

  void fetchdataapotek()async{
    final String response = await rootBundle.loadString('asset/apoteklatlong.json');
    final data = await jsonDecode(response);
    
    _apoteklist = data["items"];
    
    notifyListeners();
    print("total is: ${_apoteklist.length}");
  } 
}