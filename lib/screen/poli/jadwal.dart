import 'package:flutter/material.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';
import 'package:healthproject/widget/jadwal/bordercontainer.dart';
import 'package:provider/provider.dart';

// void main() async {
//   runApp(const JadwalPoli());
// }

class JadwalPoli extends StatefulWidget {
  static const routename = "/JadwaPoli";
  const JadwalPoli({super.key});

  @override
  State<JadwalPoli> createState() => _JadwalPoliState();
}

class _JadwalPoliState extends State<JadwalPoli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          // IconButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'images/logodaftar.png',
            height: 100,
            width: 100,
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        body: Consumer<JadwalProvider>(
            builder: ((context, jadwalprovider, child) {
          final loadJadwalProvider = jadwalprovider.jadwalPoli;
          if (loadJadwalProvider == null || loadJadwalProvider.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Pilih Jadwal Poli Umum",
                      style: TextStyle(
                          color: Color.fromARGB(255, 65, 65, 65),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: const Color.fromARGB(22, 0, 0, 0))
                        ]),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          children: [
                            BorderContainer(fungsi: () {}, text: "Senin"),
                            BorderContainer(fungsi: () {}, text: "Selasa"),
                            BorderContainer(fungsi: () {}, text: "Rabu"),
                            BorderContainer(fungsi: () {}, text: "Kamis"),
                            BorderContainer(fungsi: () {}, text: "Jumat"),
                            BorderContainer(fungsi: () {}, text: "Sabtu")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Column(
                      children: [
                        Text(loadJadwalProvider[0].nama),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: loadJadwalProvider[0].jadwalPoli.length,
                            itemBuilder: (context, idx) {
                              var getdata = loadJadwalProvider[0].jadwalPoli[idx];
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
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 340,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 206, 75, 191),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, FormPendaftaran.routename);
                      },
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          }
        })));
  }
}
