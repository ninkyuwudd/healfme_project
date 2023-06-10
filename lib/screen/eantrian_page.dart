import 'package:flutter/material.dart';

class EAntrian extends StatelessWidget {
  const EAntrian({Key? key}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'images/logodaftar.png',
          height: 100,
          width: 100,
        ),
        centerTitle: true,
      ),
      body: Padding(
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
            Card(
              child: Stack(
                children: [
                  Image.asset(
                    'images/tiketkecil.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              'A32',
                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            'images/qr_code.png',
                            width: 150,
                            height: 150,
                          ), // Ganti dengan gambar QR code sesuai kebutuhan Anda
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Color.fromRGBO(
                  239, 191, 255, 1), // Ubah warna card sesuai keinginan Anda
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
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Datang ke puskesmas 5 nomor sebelum antrianmu',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Tunggu sampai nomor antrian Anda dipanggil',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Tunjukkan QR code atau eAntrian ke loket puskesmas',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'QR code di-scan oleh petugas',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Pasien siap dilayani oleh poli pelayanan',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
