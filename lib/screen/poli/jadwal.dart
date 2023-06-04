import 'package:flutter/material.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';
import 'package:provider/provider.dart';

import '../../provider/jadwalPoli_provider.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<getWaktuProvider>(context, listen: false).fetchData();
  }

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
      body: Container(
        margin: EdgeInsets.all(15),
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
            decoration: BoxDecoration(
              color:Colors.white,

            ),
            child: Row(
              children: [
                Text("nice"),
                Text("nice")
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: Consumer<getWaktuProvider>(
              builder: (context, value, child) {
                final showdata = value.namPoli;

                if (value.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: showdata.length,
                        itemBuilder: (context, index) {
                          final poli = showdata[index];

                          return Container(
                            height: 400,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: poli.jadwalpoli.length,
                              itemBuilder: (context, index) {
                                final getpoli = poli.jadwalpoli[index];

                                return Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 206, 75, 191),
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 25),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          getpoli.hari,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          getpoli.waktu,
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Spacer(),
          Container(
         
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 206, 75, 191),
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
}
