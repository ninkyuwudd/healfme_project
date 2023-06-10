import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/screen/navigationbar.dart';
import 'package:healthproject/widget/rounded_field_white.dart';
import 'package:healthproject/widget/rounded_value_field.dart';

import '../model/user_model.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});
  static const routename = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {





  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  bool _obscuretext = true;
  bool usercheck = false;
  bool notallowedalert = false;
  bool passcheck = false;
  List<UsersAkun> usersitem = [];
  @override
  void initState() {
    fetchRecord();
    super.initState();
  }

  fetchRecord() async {
    var records = await FirebaseFirestore.instance.collection('users').get();
    maprecord(records);
  }

  maprecord(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map((item) => UsersAkun(
            // id: item["id"],
            nama: item['nama'],
            username: item['username'],
            email: item['email'],
            gender: item["gender"],
            phone: item["phone"],
            password: item["password"]))
        .toList();
    setState(() {
      usersitem = _list;
    });
  }

  var i = 0;



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


  String enkripsi(String msg) {
    msg = msg.replaceAll(" ", "");
    List<List<int>> C = makeKey();
    bool lenCheck = msg.length % 2 == 0;
    if (!lenCheck) {
      msg += "0";
    }
    List<List<int>> P = matrixToString(msg);
    int msgLen = msg.length ~/ 2;
    String enkripsiMsg = "";
    for (int i = 0; i < msgLen; i++) {
      int row0 = P[0][i] * C[0][0] + P[1][i] * C[0][1];
      int integer = (row0 % 26 + 65).toInt();
      enkripsiMsg += String.fromCharCode(integer);
      int row1 = P[0][i] * C[1][0] + P[1][i] * C[1][1];
      integer = (row1 % 26 + 65).toInt();
      enkripsiMsg += String.fromCharCode(integer);
    }
    return enkripsiMsg;
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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_decor.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 40),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      "images/logo_only.png",
                    ),
                    width: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "Masuk",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RoundeFieldWhite(
                              valuenya: username,
                              title: "Username",
                              hover: "masukkan username..",
                              check: usercheck,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 65, 65, 65),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: password,
                              obscureText: _obscuretext,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscuretext = !_obscuretext;
                                        });
                                      },
                                      icon: const Icon(Icons.remove_red_eye)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  hintText: 'Masukkan password ...',
                                  errorText: passcheck
                                      ? "Username Can't be empty!"
                                      : null),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          child: Text(
                            "Username atau Password Salah !",
                            style: TextStyle(color: Colors.red),
                          ),
                          visible: notallowedalert,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50)),
                            onPressed: () {
                              if (username.text.isEmpty) {
                                setState(() {
                                  usercheck = true;
                                });
                              } else {
                                setState(() {
                                  usercheck = false;
                                });
                              }

                              if (password.text.isEmpty) {
                                setState(() {
                                  passcheck = true;
                                });
                              } else {
                                passcheck = false;
                              }

                              if (password.text.isNotEmpty &
                                  username.text.isNotEmpty) {
                                for (var i = 0; i < usersitem.length; i++) {
                                  // print(dekripsi(usersitem[i].password ?? ""));
                                  // print(usersitem[i].username?.toLowerCase());
                                  if (username.text == usersitem[i].username &&
                                      password.text.toUpperCase() == dekripsi(usersitem[i].password ?? "")) {
                                  Navigator.pushReplacementNamed(context, BottomNavigationBarPage.routename);
                                    notallowedalert = false;
                                    
                                    break;
                                  } else {
                                    notallowedalert = true;
                                  }
                                }
                              } else {
                                print("salah");
                              }
                            },
                            child: Text(
                              "Masuk",
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("don't have account?"),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/register');
                                },
                                child: Text("Register",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 222, 33, 121),
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
