import 'package:flutter/material.dart';
import 'package:healthproject/provider/berita_provider.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'berita_detail_page.dart';

class BeritaPage extends StatefulWidget {
  static const routename = "/beritapage";
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BeritaProvider>(context, listen: false).fetchberita();
  }
  @override
  Widget build(BuildContext context) {
    final loadberita = Provider.of<BeritaProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Berita terkini"),
        ),
        body: ListView.builder(
            itemCount: loadberita.berita.length,
            itemBuilder: (ctx, index) {
              final beritadata = loadberita.berita[index];
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(22, 0, 0, 0),
                      blurRadius: 2,
                      spreadRadius: 4)
                ]),
                child: ListTile(
                  title: Text(beritadata.title),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text(beritadata.author),
                          Spacer(),
                          Text(DateFormat.yMMMd()
                              .format(DateTime.parse(beritadata.date)))
                        ],
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: () {
                       Navigator.pushNamed(context, DetailBeritaPage.routename,arguments: index);
                      }, child: Text("Visit"))
                    ],
                  ),
                ),
              );
            }));
  }
}
