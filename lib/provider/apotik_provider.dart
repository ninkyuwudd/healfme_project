

import 'dart:convert';
import 'package:healthproject/model/apotek_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApotekProvider extends ChangeNotifier {
  List<ApotekModel> _apoteklist = [];
  List<ApotekModel> get apotek => _apoteklist;


  Future<void> fetchdataapotek() async{
    try {
        final url = "https://express-server-production-8525.up.railway.app/apotek/getApotek";
        final response = await http.get(Uri.parse(url));

        
          final jsondata = json.decode(response.body);
          _apoteklist = (jsondata['data'] as List).map((data) => ApotekModel(
            id: data['id'], 
            lat: data['lat'], 
            long: data['long'], 
            name: data['name'], 
            detail: data['detail'])).toList();
            notifyListeners();

    } catch (e) {
      print("error occure : $e");
        throw Exception('failed get data');
    }


    
  }

  // void fetchdataapotek()async{
  //   final String response = await rootBundle.loadString('asset/apoteklatlong.json');
  //   final data = await jsonDecode(response);
    
  //   _apoteklist = data["items"];
    
  //   notifyListeners();
  //   print("total is: ${_apoteklist.length}");
  // } 
}