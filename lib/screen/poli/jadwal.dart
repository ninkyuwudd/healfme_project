import 'package:flutter/material.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:healthproject/widget/jadwal/bordercontainer.dart';
import 'package:healthproject/widget/popup_warning.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
          var getNamaPoli = ModalRoute.of(context)!.settings.arguments as String;
           Provider.of<JadwalProvider>(context, listen: false)
        .getJadwalPolidata(getNamaPoli, "Senin");
    });

  }

  getdata() async {
    CircularProgressIndicator();
    Future.delayed(Duration(seconds: 5));
  }

  String _char = "";
  String hari = "";

  @override
  Widget build(BuildContext context) {
    var getNamaPoli = ModalRoute.of(context)!.settings.arguments as String;
    var loadJadwal = Provider.of<JadwalProvider>(context);
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
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        body: 
        Consumer<JadwalProvider>(
            builder: ((context, jadwalprovider, child) {
          final loadJadwalProvider = jadwalprovider.jadwalPoli;
          if (loadJadwalProvider == null || loadJadwalProvider.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return 
            SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Pilih Jadwal",
                      style: TextStyle(
                          color: Color.fromARGB(255, 65, 65, 65),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: const Color.fromARGB(22, 0, 0, 0))
                        ]),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          children: [
                            CustomRadioButton(
                                buttonLables: [
                                  "Senin",
                                  "Selasa",
                                  "Rabu",
                                  "Kamis",
                                  "Jumat",
                                  "Sabtu"
                                ],
                                buttonValues: [
                                  "Senin",
                                  "Selasa",
                                  "Rabu",
                                  "Kamis",
                                  "Jumat",
                                  "Sabtu"
                                ],
                                radioButtonValue: (value) {
                                  _char = "";
                                  loadJadwal.getJadwalPolidata(
                                      getNamaPoli, value);
                                },
                                unSelectedColor:
                                    const Color.fromARGB(255, 223, 223, 223),
                                selectedColor:
                                    Color.fromARGB(255, 206, 75, 191)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2 - 40,
                    child: Column(
                      children: [
                        Text(
                          loadJadwalProvider[0].nama,
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: loadJadwalProvider[0].jadwalPoli.length,
                            itemBuilder: (context, idx) {
                              var getdata =
                                  loadJadwalProvider[0].jadwalPoli[idx];
                              return GestureDetector(
                                onTap: () {
                                  print(getdata.hari);
                                  print(getdata.waktu);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 2,
                                            blurRadius: 2)
                                      ]),
                                  child: ListTile(
                                    title: Text(getdata.waktu),
                                    subtitle: Text(getdata.hari),
                                    trailing: Icon(Icons.arrow_right),
                                    leading: Radio(
                                      value: getdata.waktu,
                                      groupValue: _char,
                                      onChanged: (value) {
                                        setState(() {
                                          hari = getdata.hari;
                                          _char = value as String;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 340,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 206, 75, 191),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if(_char == ""){
                          showDialog(context: context, builder: (context){
                            return PopupWarning(pesan: "Pilih Jadwal terlebih dahulu !");
                          });
                        }else{
                          print("jam : $_char");
                          print("hari : $hari");
                          // print(DateFormat.E().format(DateTime.now()));
                          List jadwalPilihan = [_char,hari];
                          loadJadwal.getUserJadwal(jadwalPilihan);
                          Navigator.pushNamed(context, FormPendaftaran.routename);
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
            );
          }
        })));
  }
}
