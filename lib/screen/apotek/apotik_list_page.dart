import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/provider/apotik_provider.dart';
import 'package:healthproject/provider/geolocator_provider.dart';
import 'package:provider/provider.dart';

import 'apotik_maps_page.dart';

class ApotekList extends StatefulWidget {

  static const routename = "/apoteklist";
  const ApotekList({super.key});

  @override
  State<ApotekList> createState() => _ApotekListState();
}

class _ApotekListState extends State<ApotekList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loaddata = Provider.of<ApotekProvider>(context, listen: false);
      loaddata.fetchdataapotek();
    });

    //untuk get lokasi kita saat ini
    Provider.of<CurrentLocProvider>(context,listen: false).getlocation();
  }

  bool display = false;
  double toradians(double radian) {
    return radian * (pi / 180);
  }


  //bagian menghiutng jarak terdekat dari posisi sekarang

  hitungjarak(var lat1, var lat2, var long1, var long2) {
    double rbumi = 6371;

    double latRad1 = toradians(lat1);
    double latRad2 = toradians(lat2);
    double longRad1 = toradians(long1);
    double longRad2 = toradians(long2);

    var delta_lat = latRad2 - latRad1;
    var delta_long = longRad2 - longRad1;

    double a = pow(sin(delta_lat / 2), 2) +
        cos(latRad1) * cos(latRad2) * pow(sin(delta_long / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    var distance = rbumi * c;

    return distance;
  }

  @override
  Widget build(BuildContext context) {

    var loadcurloc = Provider.of<CurrentLocProvider>(context);
    var curlat = loadcurloc.pslat;
    var curlong = loadcurloc.pslong;
    return Scaffold(
      appBar: AppBar(
        title: Text("apotek list"),
      ),
      body:curlat == null || curlong == null ? Center(child: CircularProgressIndicator(),) :Container(
              height: MediaQuery.of(context).size.height,
              child: Consumer<ApotekProvider>(
                  builder: (context, apotekprovider, _) {

                    print("lat :$curlat,long : $curlong");

                final showdata = apotekprovider.apotek;
                  //bagian sorting data agar urut dari yg paling dekat
                  showdata.sort((a, b) {
                  double jarakA =
                      hitungjarak(curlong, a.lat,curlat, a.long);

                  double jarakB =
                      hitungjarak(curlong, b.lat,curlat, b.long);

                  return jarakA.compareTo(jarakB);


                });
                return Container(
                  child: ListView.builder(
                      itemCount: showdata.length,
                      itemBuilder: (context, index) {

                        final idxapotik = showdata[index];

                        double jarakterdekat = hitungjarak(113.7164,
                            idxapotik.lat, -8.1651, idxapotik.long);

                        

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ApotikTerdekatPage.routename,
                                arguments: idxapotik);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(17, 255, 0, 187),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(1, 2))
                                ]
                                ),
                            child: ListTile(
                              leading: Text(
                                  "${jarakterdekat.toStringAsFixed(1)} km",style: TextStyle(color: Colors.black45),),
                              title: Text(idxapotik.name,style: TextStyle(color: Colors.black87),),
                              trailing: Image(image: AssetImage("images/maprow.png"),width: 40,),
                            ),
                          ),
                        );
                      }),
                );
              }),
            )

    );
  }
}
