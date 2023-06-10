import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:healthproject/screen/poli/daftar_poli.dart';
import 'package:healthproject/widget/daftar/form_common.dart';
import 'package:healthproject/widget/daftar/form_number.dart';

// void main() async {
//   runApp(const FormPendaftaran());
// }

class FormPendaftaran extends StatefulWidget {
  static const routename = "/FormPendaftaran";
  const FormPendaftaran({super.key});

  @override
  State<FormPendaftaran> createState() => _FormPendaftaranState();
}

class _FormPendaftaranState extends State<FormPendaftaran> {
  final _formState = GlobalKey<FormState>();
  final nama = TextEditingController();
  final usia = TextEditingController();
  final nik = TextEditingController();
  final alamat = TextEditingController();
  final nopenjamin = TextEditingController();

  String? gender; //untuk dropdown
  String? penjamin; //untuk dropdown

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
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Pendaftaran Poli Umum",
                    style: TextStyle(
                        color: Color.fromARGB(255, 65, 65, 65),
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Form(
                  key: _formState,
                  child: Column(children: [


                    FormCommon(value: nama, title: "Nama Lengkap", hover: "masukkan nama..."),
                    FormNumber(value: usia, title: "Usia", hover: "masukkan usia..."),
                    FormNumber(value: nik, title: "NIK", hover: "masukkan NIK..."),
                    FormCommon(value: alamat, title: "Alamat", hover: "masukkan alamat..."),

                    //Dropdown 1
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

                    //Dropdown 2
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: DropdownButtonFormField(
                        value: penjamin,
                        items: ["BPJS", "Umum"]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.toString()),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (vall) {
                          setState(() {
                            penjamin = vall as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                          color: Color.fromARGB(255, 254, 36, 120),
                        ),
                        dropdownColor: const Color.fromARGB(255, 240, 144, 182),
                        decoration: InputDecoration(
                            labelText: "Penjamin",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 254, 36, 120)),
                            prefixIcon: Icon(
                              Icons.card_membership_rounded,
                              color: Color.fromARGB(255, 254, 36, 120),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 240, 144, 182),
                                ))),
                      ),
                    ),

                    //Form Kelima
                    FormCommon(value: nopenjamin, title: "Nomor Penjamin", hover: "masukkan nomor penjamin..."),
                   

                    const SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                      width: 340,
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
                          if (_formState.currentState!.validate()) {
                            
                            Navigator.pushNamed(context, UnggahKtpBpjs.routename);
                          } else {
                            
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
        ),
      ),
    );
  }
}
