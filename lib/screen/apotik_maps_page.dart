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
  Set<Polyline> _polines = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex1'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(-8.184486, 113.668076),
  );

  void _createpolyline(var lat, var long) {
    Polyline polyline = Polyline(
        polylineId: PolylineId('Rute'),
        color: Colors.blue,
        width: 4,
        points: [
          LatLng(113.7164, -8.1651),
          LatLng(113.7155, -8.1655),
          LatLng(113.7150, -8.1660)
        ]);

    setState(() {
      _polines.add(polyline);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set<Marker> _marker = {};
    final arg = ModalRoute.of(context)?.settings.arguments as dynamic;
    final lat = arg.lat;
    final long = arg.long;
    final name = arg.name;
    final alamat = arg.detail;
    print(lat.toString());
    print(long.toString());

    Set<Marker> makers = {};

    Marker marker = Marker(
        markerId: MarkerId('01'),
        position: LatLng(long, lat),
        infoWindow: InfoWindow(title: name));

    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(long, lat),
      zoom: 16.4746,
    );

    makers.add(marker);

    return Scaffold(
      appBar: AppBar(
        title: Text("Apotek Terdekat"),
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          polylines: _polines,
          markers: makers,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            _createpolyline(lat, long);
          }),
      bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (BuildContext ctx) => Container(
                width: double.infinity,
                height: 250,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(15, 0, 0, 0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Detail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(alamat),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Lat:$lat"),SizedBox(width: 10,), Text("Long:$long")],
                    )
                  ],
                ),
              )),
    );
  }
}
