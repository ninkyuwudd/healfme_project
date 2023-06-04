import 'package:flutter/material.dart';
import 'package:healthproject/model/jadwalpoli_model.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:provider/provider.dart';

class Apijadwaltest extends StatefulWidget {
  @override
  State<Apijadwaltest> createState() => _ApijadwaltestState();
}

class _ApijadwaltestState extends State<Apijadwaltest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<getWaktuProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final poliGigiProvider = Provider.of<getWaktuProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Hari Values'),
        ),
        body: Consumer<getWaktuProvider>(
          builder: (context, value, _) {
            final showdata = value.namPoli;
            if (value.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: showdata.length,
                  itemBuilder: (context, index) {
                    final poli = showdata[index];
                    return Column(
                      children: [
                        Text("nama: ${poli.nama}"),
                        
                       
                    
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: poli.jadwalpoli.length,
                          itemBuilder: (context, index) {
                            final jadwal = poli.jadwalpoli[index];
                            return ListTile(
                              title: Text(jadwal.hari),
                              subtitle: Text(jadwal.waktu),
                            );
                          },
                        )
                      ],
                    );
                  });
            }
          },
        ));
  }
}
