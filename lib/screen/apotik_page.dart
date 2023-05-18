import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApotikTerdekatPage extends StatefulWidget {
  static const routename = "/apotik";
  const ApotikTerdekatPage({super.key});

  @override
  State<ApotikTerdekatPage> createState() => _ApotikTerdekatPageState();
}

class _ApotikTerdekatPageState extends State<ApotikTerdekatPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex1'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(-8.184486, 113.668076),
  );
  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kLakeMarker'),
    infoWindow: InfoWindow(title: 'Google Plex2'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(-7.983908, 112.621391),
  );
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-8.184486, 113.668076),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = [
    Marker(markerId: MarkerId("M1"),
    position: LatLng(-8.184486, 113.668076),
    infoWindow: InfoWindow(
      title: "Current Position"
    )
    )
  ]; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Apotek Terdekat"),
        ),
        body:GoogleMap(
              mapType: MapType.normal,
              markers: Set<Marker>.of(_marker),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }
              ),
        );
  }
}
