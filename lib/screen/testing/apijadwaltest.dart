import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/jadwalPoli_provider.dart';

class GetJadwal extends StatefulWidget {
  const GetJadwal({super.key});

  @override
  State<GetJadwal> createState() => _GetJadwalState();
}

class _GetJadwalState extends State<GetJadwal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<JadwalProvider>(context, listen: false).getJadwalPolidata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test jadwal"),
        ),
        body: Consumer<JadwalProvider>(
          builder: (context, jadwalprovider, _) {
            final jadwalspoli = jadwalprovider.jadwalPoli;
            if (jadwalspoli == null || jadwalspoli.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Column(
                    children: [
                      Text(jadwalspoli[0].nama),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: jadwalspoli[0].jadwalPoli.length,
                          itemBuilder: (context, idx) {
                            var getdata = jadwalspoli[0].jadwalPoli[idx];
                            return Column(
                              children: [
                                Text(getdata.hari),
                                Text(getdata.waktu)
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
