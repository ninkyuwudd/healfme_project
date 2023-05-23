import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApotikTerdekatPage extends StatefulWidget {
  static const routename = "/apotikmaps";
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

  @override
  Widget build(BuildContext context) {
    // Set<Marker> _marker = {};
    final arg = ModalRoute.of(context)?.settings.arguments as dynamic;
    final lat = arg['lat'];
    final long = arg['long'];
    final name = arg['nama'];
    print(lat.toString());
    print(long.toString());

    Set<Marker> makers = {};

    Marker marker = Marker(markerId: MarkerId('01'),
    position: LatLng(long,lat),
    infoWindow: InfoWindow(title: name)
    );

    CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(long, lat),
    zoom: 14.4746,
  );

    makers.add(marker);

    return Scaffold(
      appBar: AppBar(
        title: Text("Apotek Terdekat"),
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          markers: makers,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
    );
  }
}
