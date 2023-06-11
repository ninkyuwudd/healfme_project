import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthproject/provider/apotik_provider.dart';
import 'package:healthproject/provider/geolocator_provider.dart';

import 'package:provider/provider.dart';

import 'apotek/apotik_maps_page.dart';

class ApotekListTest extends StatefulWidget {
  static const routename = "/apoteklisttest";
  const ApotekListTest({super.key});

  @override
  State<ApotekListTest> createState() => _ApotekListTestState();
}

class _ApotekListTestState extends State<ApotekListTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApotekProvider>(context, listen: false).fetchdataapotek();
    Provider.of<CurrentLocProvider>(context, listen: false).getlocation();
  }

  bool display = false;
  double toradians(double radian) {
    return radian * (pi / 180);
  }

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
    var loadapotek = Provider.of<ApotekProvider>(context);
    var getapotek = loadapotek.apotek;

    var loadcurloc = Provider.of<CurrentLocProvider>(context);
    var curlat = loadcurloc.pslat;
    var curlong = loadcurloc.pslong;
    return Scaffold(
        appBar: AppBar(
          title: Text("apotek list"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: getapotek.length,
              itemBuilder: (context, index) {
                final idxapotik = getapotek[index];

                // getapotek.sort((a, b) {
                //   double jarakA =
                //       hitungjarak(113.7164, a["lat"], -8.1651, a["long"]);
                //   double jarakB =
                //       hitungjarak(113.7164, b["lat"], -8.1651, b["long"]);
                //   return jarakA.compareTo(jarakB);
                // });

                // double jarakterdekat = hitungjarak(
                //     113.7164, idxapotik.lat, -8.1651, idxapotik["long"]);
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ApotikTerdekatPage.routename,
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
                        ]),
                    child: ListTile(
                      // leading: Text(
                      //   "${jarakterdekat.toStringAsFixed(1)} km",
                      //   style: TextStyle(color: Colors.black45),
                      // ),
                      // title: Text(
                      //   idxapotik["nama"],
                      //   style: TextStyle(color: Colors.black87),
                      // ),
                      trailing: Image(
                        image: AssetImage("images/maprow.png"),
                        width: 40,
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
