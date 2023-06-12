import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/widget/daftar/form_number.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../provider/pilihfile_controller.dart';
import '../../widget/daftar/form_common.dart';

class EditProfil extends StatefulWidget {
  static const routename = "/edit_profil";

  const EditProfil({Key? key}) : super(key: key);

  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
    FirebaseStorage storage = FirebaseStorage.instance;
      final firestoredb = FirebaseFirestore.instance.collection('users');
  final _formState = GlobalKey<FormState>();
  String imageurl = "";
  TextEditingController _dateController = TextEditingController();

  var nama = TextEditingController();
  var email = TextEditingController();
  var username = TextEditingController();
  var phone = TextEditingController();
  var pass = TextEditingController();
  

  String? gender;
  

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat("yyyy-MM-dd")
            .format(picked); // Atur nilai teks dengan tanggal yang dipilih
      });
    }
  }

    Future<void> getImageurl(String namaimg) async {
    String get = "file/$namaimg";
    Reference storageReference = storage.ref().child(get);
    imageurl = await storageReference.getDownloadURL();
    setState(() {});
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  var loaduser = Provider.of<UserProvider>(context,listen: false);
  var getuser = loaduser.getUserData;


  nama.text = getuser[0];
   email.text = getuser[2];
   username.text = getuser[1];
   phone.text = getuser[4];

   pass.text = getuser[5];
  }

  @override
  Widget build(BuildContext context) {
    var loaduser = Provider.of<UserProvider>(context,listen: false);
      var getuser = loaduser.getUserData;
  
      final imgcontroller = Provider.of<PilihUploadfile>(context);

          if (imgcontroller.pickfile != null) {
      getImageurl(imgcontroller.pickfile!.name);
    } else {
      print("data masih kosong");
    }
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Edit Profil',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Stack(
                children: [
imgcontroller.pickfile == null
                          ? CircleAvatar(
                              backgroundImage:
                                  AssetImage("images/empty.jpg"),
                              radius: 70,
                            )
                          : CircleAvatar(
                              foregroundImage: FileImage(
                                  File(imgcontroller.pickfile!.path!)),
                              radius: 70,
                            ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Aksi yang akan dilakukan ketika tombol edit diteka
                        imgcontroller.selectFile();
                      },
                      child: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
                           Form(
                  key: _formState,
                  child: Column(children: [


                    FormCommon(value: nama, title: "Nama Lengkap", hover: "masukkan nama..."),
                    FormCommon(value: email, title: "Email", hover: "masukkan email..."),
                    FormCommon(value: username, title: "Username", hover: "masukkan username..."),
                    FormNumber(value: phone, title: "Nomor Hp", hover: "masukkan nomor hp..."),
                                        Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: DropdownButtonFormField(
                        value: gender,
                        items: ["Laki-Laki", "Perempuan"]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.toString()),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            gender = val as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Color.fromARGB(255, 254, 36, 120),
                        ),
                        dropdownColor: const Color.fromARGB(255, 240, 144, 182),
                        decoration: InputDecoration(
                            labelText: "Jenis Kelamin",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 254, 36, 120)),
                            prefixIcon: Icon(
                              Icons.accessibility_new_rounded,
                              color: Color.fromARGB(255, 254, 36, 120),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 240, 144, 182),
                                ))),
                      ),
                    ),

                    FormCommon(value: pass, title: "Password", hover: "masukkan  password..."),
                    
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 206, 75, 191),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        onPressed: () {
                          print(getuser[6]);
                          if (_formState.currentState!.validate()) {
                            imgcontroller.uploadfile();
                            firestoredb.doc(getuser[6]).update({
                                      "nama": nama.text,
                                      "username": username.text,
                                      "email": email.text,
                                      "gender": gender,
                                      "phone": phone.text,
                                      "password": pass.text,
                                      "gambar" : imageurl
                            });
                            loaduser.insertDataSekarang([nama.text,username.text,email.text,gender,phone.text,pass.text,getuser[6],imageurl]);
                            // Navigator.pushNamed(context, UnggahKtpBpjs.routename);
                          } else {
                            print("masih kosong");
                          }
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
          ],
        ),
      ),
    );
  }
}