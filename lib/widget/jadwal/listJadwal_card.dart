import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/jadwalPoli_provider.dart';

class ListJawalCard extends StatefulWidget {
  const ListJawalCard({super.key});

  @override
  State<ListJawalCard> createState() => _ListJawalCardState();
}

class _ListJawalCardState extends State<ListJawalCard> {
  String _char = "";
  String hari = "";

  bool cirular = true;
  bool content = false;

  @override
  void initState() {
    super.initState();
    loadingdata();
  }

  loadingdata()async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JadwalProvider>(builder: ((context, jadwalprovider, child) {
      final loadJadwalProvider = jadwalprovider.jadwalPoli;
      if (loadJadwalProvider == null || loadJadwalProvider.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Column(
          children: [
            Visibility(
              visible:  cirular,
              child: Container(child: CircularProgressIndicator(
                
              ),),
            ),
            Visibility(
              visible: content,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2 - 40,
                child: Column(
                  children: [
                    Text(
                      loadJadwalProvider[0].nama,
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: loadJadwalProvider[0].jadwalPoli.length,
                        itemBuilder: (context, idx) {
                          var getdata = loadJadwalProvider[0].jadwalPoli[idx];
            
                          return GestureDetector(
                            onTap: () {
                              print(getdata.hari);
                              print(getdata.waktu);
                              print("oke");
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 2)
                                  ]),
                              child: ListTile(
                                title: Text(getdata.waktu),
                                subtitle: Text(getdata.hari),
                                trailing: Icon(Icons.arrow_right),
                                leading: Radio(
                                  value: getdata.waktu,
                                  groupValue: _char,
                                  onChanged: (value) {
                                    setState(() {
                                      hari = getdata.hari;
                                      _char = value as String;
                                    });
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    }));
  }
}
