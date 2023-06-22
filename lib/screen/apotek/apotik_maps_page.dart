import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/geolocator_provider.dart';

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


  //create polyline tapi belum work

  @override
  Widget build(BuildContext context) {

    var loadcurloc = Provider.of<CurrentLocProvider>(context);
    var curlat = loadcurloc.pslat;
    var curlong = loadcurloc.pslong;
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

    Marker markerStart = Marker(
        markerId: MarkerId('02'),
        position: LatLng(curlat, curlong),
        infoWindow: InfoWindow(title: "You"));


      CameraPosition _current = CameraPosition(
        
      target: LatLng(curlat, curlong),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
        
        );

      
      CameraPosition _tujuan = CameraPosition(
        
      target: LatLng(long, lat),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
        
        );

          Future<void> _curretloc() async{
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_current));
  }


            Future<void> _tujuanloc() async{
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_tujuan));
  }




    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(long, lat),
      zoom: 16.4746,
    );

    makers.add(marker);
    makers.add(markerStart);

  

    




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
           
          }),

      floatingActionButton: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2 + 40),
        child: Column(
          children: [
                      FloatingActionButton.extended(onPressed: (){
              _tujuanloc();
            }, label: Icon(Icons.pin_drop_outlined)),
            SizedBox(height: 20,),
            FloatingActionButton.extended(onPressed: (){
              _curretloc();
            }, label: Icon(Icons.perm_identity_outlined)),
          ],
        ),
      ),
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
