import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:dropdown_button2/dropdown_button2.dart';

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
  final textController = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();
  final textController5 = TextEditingController();

  String? selectedValue; //untuk dropdown
  String? selectedValue2; //untuk dropdown

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
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: TextFormField(
                        autofocus: true,
                        controller: textController,
                        validator: (value) {
                          if (value == '') return "Text tidak boleh kosong";
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 240, 144, 182))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 240, 144, 182))),
                          label: Text('Nama Lengkap'),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 254, 36, 120)),
                          hintText: ("Amanda Vania"),
                        ),
                      ),
                    ),

                    //Form Kedua

                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: TextFormField(
                          autofocus: true,
                          controller: textController2,
                          validator: (value) {
                            if (value == '') return "Text tidak boleh kosong";
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 240, 144, 182))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 240, 144, 182))),
                            label: Text('Usia'),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 254, 36, 120)),
                            hintText: ("20"),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    ),

                    //Form ketiga

                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: TextFormField(
                          autofocus: true,
                          controller: textController3,
                          validator: (value) {
                            if (value == '') return "Text tidak boleh kosong";
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 240, 144, 182))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 240, 144, 182))),
                            label: Text('NIK'),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 254, 36, 120)),
                            hintText: ("35090943759"),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    ),

                    //Form Keempat
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: TextFormField(
                        autofocus: true,
                        controller: textController4,
                        validator: (value) {
                          if (value == '') return "Text tidak boleh kosong";
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 240, 144, 182))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 240, 144, 182))),
                          label: Text('Alamat'),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 254, 36, 120)),
                          hintText: ("Jln.Tutwuri Handayani"),
                        ),
                      ),
                    ),

                    //Dropdown 1
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: DropdownButtonFormField(
                        value: selectedValue,
                        items: ["Laki-Laki", "Perempuan"]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.toString()),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedValue = val as String;
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
                        value: selectedValue2,
                        items: ["BPJS", "Umum"]
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.toString()),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (vall) {
                          setState(() {
                            selectedValue2 = vall as String;
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

                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: TextFormField(
                          autofocus: true,
                          controller: textController5,
                          validator: (value) {
                            if (value == '') return "Text tidak boleh kosong";
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 240, 144, 182))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 240, 144, 182))),
                            label: Text('Nomor Penjamin'),
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 254, 36, 120)),
                            hintText: ("002321588456"),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    ),

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
                            print('Anjai bisa');
                            // Kalo uda divalidasi taro disini
                          } else {
                            print("gila lo");
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
