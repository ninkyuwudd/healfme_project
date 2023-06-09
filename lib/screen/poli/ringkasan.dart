import 'package:flutter/material.dart';
import 'package:healthproject/model/jadwalpoli_model.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/navigationbar.dart';
import 'package:provider/provider.dart';
import '../../widget/textringkasan.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ringkasan extends StatefulWidget {
  static const routename = "/Ringkasan";
  const Ringkasan({super.key});

  @override
  State<Ringkasan> createState() => _RingkasanState();
}

class _RingkasanState extends State<Ringkasan> {
  @override
  Widget build(BuildContext context) {
    var getuser = Provider.of<UserProvider>(context);
    var dataUser = getuser.dataPribadiUser;
    var getjadwal = Provider.of<JadwalProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
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
            // Color.fromARGB(249, 142, 191, 232),
            body: SingleChildScrollView(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Ringkasan e-booking",
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 65, 65),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Image.asset(
                            'images/bgringkasan.png',
                            height: 600,
                            width: 400,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(85, 30, 50, 0),
                          child: Text(
                            "PUSKESMAS PATRANG",
                            style: TextStyle(
                                color: Color.fromARGB(255, 254, 36, 120),
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(55, 60, 20, 0),
                          child: Text(
                            "Jl. Kaca Piring No.5, Gebang Tengah, Gebang, Kec. Patrang, Kabupaten Jember, Jawa Timur 68117",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 126, 126, 126)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(60, 85, 20, 0),
                          child: Text(
                            "------------------------",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 255, 161, 204)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(140, 120, 20, 0),
                          child: Text(
                            "POLI UMUM",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 206, 75, 191)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(60, 150, 60, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRingkasan(
                                    isi: "Nama Lengkap",
                                    isi2: const Color.fromARGB(
                                        255, 100, 100, 100),
                                  ),
                                  TextRingkasan(
                                    isi: "NIK",
                                    isi2: Color.fromARGB(255, 100, 100, 100),
                                  ),
                                  TextRingkasan(
                                    isi: "Alamat",
                                    isi2: Color.fromARGB(255, 100, 100, 100),
                                  ),
                                  TextRingkasan(
                                    isi: "Jenis Kelamin",
                                    isi2: Color.fromARGB(255, 100, 100, 100),
                                  ),
                                  TextRingkasan(
                                    isi: "Usia",
                                    isi2: Color.fromARGB(255, 100, 100, 100),
                                  ),
                                  TextRingkasan(
                                    isi: "Penjamin",
                                    isi2: Color.fromARGB(255, 100, 100, 100),
                                  ),
                                  TextRingkasan(
                                    isi: "Nomor Penjamin",
                                    isi2: Color.fromARGB(255, 100, 100, 100),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextRingkasan(
                                    isi: dataUser[0],
                                    isi2: Colors.black,
                                  ),
                                  TextRingkasan(
                                    isi: dataUser[1],
                                    isi2: Colors.black,
                                  ),
                                  TextRingkasan(
                                    isi: dataUser[2],
                                    isi2: Colors.black,
                                  ),
                                  TextRingkasan(
                                    isi: dataUser[4],
                                    isi2: Colors.black,
                                  ),
                                  TextRingkasan(
                                    isi: dataUser[3],
                                    isi2: Colors.black,
                                  ),
                                  TextRingkasan(
                                    isi: dataUser[5],
                                    isi2: Color.fromARGB(255, 23, 23, 23),
                                  ),
                                  TextRingkasan(
                                    isi: dataUser[6],
                                    isi2: Color.fromARGB(255, 23, 23, 23),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 350, 20, 50),
                            child: Center(
                              child: QrImageView(
                                data: 
                                
                                '''
${dataUser[0]}
${dataUser[1]}
${dataUser[2]}
${dataUser[4]} 
${dataUser[3]}
${dataUser[5]}
${dataUser[6]}
                                ''',
                                version: QrVersions.auto,
                                size: 150,
                                gapless: false,
                              ),
                            )),
               
                        Container(
                          margin: EdgeInsets.fromLTRB(60, 485, 20, 0),
                          child: Text(
                            "------------------------",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 255, 161, 204)),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(132, 520, 0, 0),
                                child: Text(
                                  "Nomor Antrian Anda",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 254, 36, 120),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(132, 0, 0, 0),
                                child: Text(
                                  getjadwal.pilihanJadwal[2],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 254, 36, 120),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(132, 0, 0, 0),
                                child: Text(
                                  "${getjadwal.pilihanJadwal[1]}, ${getjadwal.pilihanJadwal[0]}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 206, 75, 191),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 320,
                      height: 35,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 206, 75, 191),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, BottomNavigationBarPage.routename);
                          // Navigator.pop(context);
                        },
                        child: const Text(
                          "eAntrian",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,)
                  ]),
            ))));
  }
}
