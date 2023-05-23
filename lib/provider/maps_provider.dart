import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapsApiProvider extends ChangeNotifier{

  fetchdatamaps(String apikey,double latitude,double longitude)async{
      final url = 'https://www.mapquestapi.com/staticmap/v5/map?key=$apikey&center=$latitude,$longitude&zoom=12&type=map&size=600,400';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load map data');
  }
  }

  
}