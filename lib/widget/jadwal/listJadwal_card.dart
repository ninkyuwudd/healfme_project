import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/jadwalPoli_provider.dart';

class ListJawalCard extends StatefulWidget {
   String char;
  String hari;
  ListJawalCard({super.key, required this.char, required this.hari});

  @override
  State<ListJawalCard> createState() => _ListJawalCardState();
}

class _ListJawalCardState extends State<ListJawalCard> {
  // String _char = "";
  // String hari = "";

  bool cirular = true;
  bool content = true;

  @override
  void initState() {
    super.initState();

  }

  loadingdata()async{
    await Future.delayed(Duration(seconds:1));
    setState(() {
          cirular = false;
    content = true;
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
            // Visibility(
            //   visible:  cirular,
            //   child: Container(child: CircularProgressIndicator(
                
            //   ),),
            // ),
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
                                  groupValue: widget.char,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.hari = getdata.hari;
                                      widget.char = value as String;
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
