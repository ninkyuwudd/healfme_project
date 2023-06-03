import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/berita_provider.dart';



class DetailBeritaPage extends StatefulWidget {
  static const routename = "/detailberita";
  const DetailBeritaPage({super.key});

  @override
  State<DetailBeritaPage> createState() => _DetailBeritaPageState();
}

class _DetailBeritaPageState extends State<DetailBeritaPage> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BeritaProvider>(context, listen: false).fetchberita();
  }
  @override
  Widget build(BuildContext context) {
        final loadberita = Provider.of<BeritaProvider>(context);
    
    var getdata = ModalRoute.of(context)?.settings.arguments as int;
    var getberita = loadberita.berita[getdata];
    return Scaffold(
      appBar: AppBar(
        title: Text(getberita.author),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(getberita.urlgambar),fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 20,),
              Text(getberita.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 20,),
              Divider(),
              Text(getberita.deskripsi,style: TextStyle(fontSize: 16),),
              SizedBox(height: 15,),
              Divider(),
              Text(getberita.konten)
            ],
          ),
        ),
      ),
    );
  }
}