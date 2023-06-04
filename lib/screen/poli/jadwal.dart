import 'package:flutter/material.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';

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
  final _formStateJ = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
          body: SingleChildScrollView(
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
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  width: 480,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: const Color.fromARGB(22, 0, 0, 0)
                        )
                      ]
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 206, 75, 191)),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 25, bottom: 25, top: 15),
                        child: Text(
                          "Mei, 2023",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, FormPendaftaran.routename);
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                // color: Colors.brown,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 206, 75, 191),
                                      width: 2),
                                ),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      "22",
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Senin",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 206, 75, 191),
                                    width: 2),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "23",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Selasa",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 206, 75, 191),
                                    width: 2),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "24",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Rabu",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 206, 75, 191),
                                    width: 2),
                              ),
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(),
                              child: Column(
                                children: [
                                  Text(
                                    "25",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Kamis",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 206, 75, 191),
                                    width: 2),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "26",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Jumat",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 450,
                ),
                SizedBox(
                  width: 340,
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
          ),
        ));
  }
}
