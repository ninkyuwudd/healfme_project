import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthproject/provider/maps_provider.dart';
import 'package:provider/provider.dart';



class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final String apikey = "dyjM3X6Y3MjnVb9ygjKg8gjhVLL1BS12";
  String mapData = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchmap();
  }

  fetchmap() async{
    try{
      final double  latitude = 37.7749;
      final double longitude = -122.4194;
      final data = Provider.of<MapsApiProvider>(context,listen: false).fetchdatamaps(apikey, latitude, longitude);
      setState(() {
        mapData = data.toString();
      });
    }catch(e){
      print("ada eror : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("maps"),),
      body: mapData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Image.memory(
              base64Decode(mapData),
              fit: BoxFit.contain,
            ),
    );
  }
}