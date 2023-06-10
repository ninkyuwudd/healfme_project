import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/poli/daftar_poli.dart';
import 'package:healthproject/screen/poli/jadwal.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';
import 'package:healthproject/widget/homepage/icon_grid.dart';
import 'package:healthproject/widget/homepage/profile_card.dart';
import 'package:provider/provider.dart';

import 'apotek/apotik_list_page.dart';
import 'berita/berita_page.dart';

class Homepage extends StatefulWidget {
  static const routename = "/homepage";
  // final int idx;
  // Homepage({super.key, required this.idx});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


      List<List<int>> matrixToString(String string) {
    List<int> nomor = string.split('').map(chrToInt).toList();
    int length = nomor.length;
    List<List<int>> M =
        List.generate(2, (index) => List<int>.filled(length ~/ 2, 0));
    int iterator = 0;
    for (int column = 0; column < length ~/ 2; column++) {
      for (int row = 0; row < 2; row++) {
        M[row][column] = nomor[iterator];
        iterator++;
      }
    }
    return M;
  }

  int chrToInt(String char) {
    char = char.toUpperCase();
    int integer = char.codeUnitAt(0) - 65;
    return integer;
  }

  int findMultipleInv(int determinant) {
    int multipleInv = 1;
    for (int i = 0; i < 26; i++) {
      int inverse = determinant * i;
      if (inverse % 26 == 1) {
        multipleInv = i;
        break;
      }
    }
    return multipleInv;
  }

  List<List<int>> makeKey() {
    int determinant = 0;
    List<List<int>> C;
    while (true) {
      // String? chiper = stdin.readLineSync();
      C = matrixToString("FRID");
      determinant = C[0][0] * C[1][1] - C[0][1] * C[1][0];
      determinant = determinant % 26;
      int inverseElement = findMultipleInv(determinant);
      if (inverseElement == -1) {
        print("kunci tidak invertible");
      } else if (C
          .expand((row) => row)
          .any((element) => element > 26 || element < 0)) {
        print("hanya terima a - z");
        print(C.expand((row) => row).reduce(max));
        print(C.expand((row) => row).reduce(min));
      } else {
        break;
      }
    }
    return C;
  }




  String dekripsi(String chip) {
    List<List<int>> C = makeKey();

    int determinan = C[0][0] * C[1][1] - C[0][1] * C[1][0];
    determinan = determinan % 26;
    int multicativeInv = findMultipleInv(determinan);

    List<List<int>> CInverse = [
      [C[1][1] * multicativeInv % 26, -C[0][1] * multicativeInv % 26],
      [-C[1][0] * multicativeInv % 26, C[0][0] * multicativeInv % 26]
    ];

    List<List<int>> P = matrixToString(chip);
    int msgLen = chip.length ~/ 2;
    String dekripsiMsg = "";
    for (int i = 0; i < msgLen; i++) {
      int column0 = P[0][i] * CInverse[0][0] + P[1][i] * CInverse[0][1];
      int integer = (column0 % 26 + 65).toInt();
      dekripsiMsg += String.fromCharCode(integer);
      int column1 = P[0][i] * CInverse[1][0] + P[1][i] * CInverse[1][1];
      integer = (column1 % 26 + 65).toInt();
      dekripsiMsg += String.fromCharCode(integer);
    }

    if (dekripsiMsg.endsWith("0")) {
      dekripsiMsg = dekripsiMsg.substring(0, dekripsiMsg.length - 1);
    }
    return dekripsiMsg;
  }


  @override
  Widget build(BuildContext context) {

    // final getdata = Provider.of<UserProvider>(context);
    // final loadata

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage("images/logodaftar.png"),
                      width: 120,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ProfileCardHome(name: "Reihan Wudd hibatullah"),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("PUSKESMAS JEMBER"),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Poli",
                  style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 250,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      IconGrid(
                        img: "pumum",
                        poli: "Poli Umum",
                        fungsi: () {
                          Navigator.pushNamed(context, UnggahKtpBpjs.routename);
                        },
                      ),
                      IconGrid(
                        img: "pgigi",
                        poli: "Poli Gigi",
                        fungsi: () {
                          Navigator.pushNamed(context, JadwalPoli.routename);
                        },
                      ),
                      IconGrid(
                        img: "plansia",
                        poli: "Poli Lansia",
                        fungsi: () {},
                      ),
                      IconGrid(
                        img: "pgizi",
                        poli: "Poli Gizi",
                        fungsi: () {},
                      ),
                      IconGrid(
                        img: "pkia",
                        poli: "Poli Kia",
                        fungsi: () {},
                      ),
                      IconGrid(
                        img: "sanitasi",
                        poli: "Sanitasi",
                        fungsi: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Fitur",
                  style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ApotekList.routename);
                  },
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("images/bg_card_home.png"),
                            fit: BoxFit.cover)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Cari "),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "APOTEK",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "Terdekat mu disini",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Image(
                          image: AssetImage("images/apotek.png"),
                          width: 80,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, BeritaPage.routename);
                  },
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("images/bg_card_home.png"),
                            fit: BoxFit.cover)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Berita",
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Terkini",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Image(
                          image: AssetImage("images/berita.png"),
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
