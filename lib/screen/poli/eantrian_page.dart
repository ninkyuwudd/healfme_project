import 'package:flutter/material.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:healthproject/widget/jadwal/infotext.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../provider/user_repo.dart';

class EAntrian extends StatelessWidget {
  const EAntrian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getuser = Provider.of<UserProvider>(context);
    var dataUser = getuser.dataPribadiUser;

    var loadjadwal = Provider.of<JadwalProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (contex) {
                        return AlertDialog(
                          title: Text("Cara Check-in"),
                          content: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color.fromRGBO(239, 191, 255,
                                    1), // Ubah warna card sesuai keinginan Anda
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Demi kenyamanan, pasien diharapkan sudah berada di Puskesmas 5 nomor sebelum nomor antrian Anda.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 214, 49,
                                            49), // Ubah warna teks sesuai keinginan Anda
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Cara Check-in di Puskesmas:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NumberListText(
                                      number: "1",
                                      text:
                                          'Datang ke puskesmas 5 nomor sebelum antrianmu'),
                                  NumberListText(
                                      number: "2",
                                      text:
                                          'Tunggu sampai nomor antrian Anda dipanggil'),
                                  NumberListText(
                                      number: "3",
                                      text:
                                          'Tunjukkan QR code atau eAntrian ke loket puskesmas'),
                                  NumberListText(
                                      number: "4",
                                      text: 'QR code di-scan oleh petugas'),
                                  NumberListText(
                                      number: "5",
                                      text:
                                          'Pasien siap dilayani oleh poli pelayanan'),
                                ],
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Oke"))
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.info,
                  color: Colors.black45,
                )),
          )
        ],
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
      body: getuser.daftar == false
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum ada jadwal !",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 233, 30, 182)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                      image: AssetImage("images/nojadwal.png"),
                      width: 200,
                    )
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'E-Antrian',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: MediaQuery.of(context).size.height / 2 + 70,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: loadjadwal.daftarOrderJadwal.length,
                        itemBuilder: (context, index) {
                          //isinya hari,jam , antrian
                          List dataorderjadwal = loadjadwal.daftarOrderJadwal[index];
                          
                             String geturutan = dataorderjadwal[2];
                                print(geturutan);
                          

                          return Container(
                            height: MediaQuery.of(context).size.height / 2 + 70,
                            child: ListView.builder(
                              itemCount: getuser.ListDataPasien.length,
                              itemBuilder: (context, index) {

                                //isinya nama ,usia, nik dll
                                List dataListPasien = getuser.ListDataPasien[index];
                             

                                return GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Antrian Sekarang',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'A12',
                                                style: TextStyle(
                                                  fontSize: 38,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Antrian Anda',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                geturutan,
                                                style: TextStyle(
                                                  fontSize: 38,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          
                                          QrImageView(
                                            data: '''
Nama        : ${dataListPasien[0]}
Nik         : ${dataListPasien[1]}
Alamat      : ${dataListPasien[2]}
Gender      : ${dataListPasien[4]} 
Usia        : ${dataListPasien[3]}
Penjamin    : ${dataListPasien[5]}
no penjamin : ${dataListPasien[6]}
                                    ''',
                                            version: QrVersions.auto,
                                            size: 150,
                                            gapless: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
    );
  }
}
