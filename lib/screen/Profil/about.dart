import 'package:flutter/material.dart';

class about extends StatelessWidget {
  static const routeName = '/about';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Tentang Kami',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'HealfMe merupakan aplikasi untuk mendigitalisasi dari pendaftaran atau melakukan e booking pada suatu PUSKESMAS. Aplikasi ini bertujuan untuk memudahkan masyarakat ketika sedang mengalami sakit ataupun hal yang perlu dibawa ke PUSKESMAS',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Versi 1.0.0',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
