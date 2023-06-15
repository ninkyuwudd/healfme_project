import 'package:flutter/material.dart';
import 'package:healthproject/provider/jadwalPoli_provider.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/poli/pendaftaran.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:healthproject/widget/daftar/form_common.dart';
import 'package:healthproject/widget/jadwal/bordercontainer.dart';
import 'package:healthproject/widget/jadwal/listJadwal_card.dart';
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
      // var loadjadwal = Provider.of<JadwalProvider>(context,listen: false);
      Provider.of<JadwalProvider>(context, listen: false)
          .getJadwalPolidata(getNamaPoli, "Senin");
      loadingdata();
    });
  }

  getdata() async {
    CircularProgressIndicator();
    Future.delayed(Duration(seconds: 5));
  }

  loadingdata() async {
    // print(data);
    setState(() {
      cirular = true;
      content = false;
      nodatacontent = false;
    });
    await Future.delayed(Duration(seconds: 2));
    // print(data.length);
    setState(() {
      cirular = false;
      content = true;
      // if(data.length == 0){
      //   content = false;
      //   nodatacontent = true;
      // }
    });
  }

  String _char = "";
  String hari = "";

  bool cirular = true;
  bool content = false;
  bool nodatacontent = false;

  var jadwal = TextEditingController();
  bool _obscuretext = false;
  bool jadwalcek = false;

  @override
  Widget build(BuildContext context) {
    var getNamaPoli = ModalRoute.of(context)!.settings.arguments as String;
    var loadJadwal = Provider.of<JadwalProvider>(context);
    var loaduser = Provider.of<UserProvider>(context);
    var getuser = loaduser.getUserData;
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Pilih Jadwal",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 65, 65),
                      fontSize: 15,
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
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            margin: EdgeInsets.only(left: 10),
                            defaultSelected: "Senin",
                            enableShape: true,
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
                              loadJadwal.getJadwalPolidata(getNamaPoli, value);
                              loadingdata();
                            },
                            unSelectedColor:
                                const Color.fromARGB(255, 223, 223, 223),
                            selectedColor: Color.fromARGB(255, 206, 75, 191)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Visibility(
                  visible: cirular,
                  child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(child: CircularProgressIndicator()))),

              Visibility(
                visible: content,
                child: Consumer<JadwalProvider>(
                    builder: ((context, jadwalprovider, child) {

                  final loadJadwalProvider = jadwalprovider.jadwalPoli;

                  if (loadJadwalProvider == null ||
                      loadJadwalProvider.isEmpty) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
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
                                  color:
                                      const Color.fromARGB(255, 233, 30, 182)),
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
                    );
                  } else {
                    return Column(
                      children: [
                        Visibility(
                          visible: content,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: [
                                Text(
                                  loadJadwalProvider[0].nama,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        loadJadwalProvider[0].jadwalPoli.length,
                                    itemBuilder: (context, idx) {
                                      var getdata =
                                          loadJadwalProvider[0].jadwalPoli[idx];

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _char = getdata.waktu;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(15),
                                          padding: EdgeInsets.only(
                                              left: 20, right: 20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    spreadRadius: 2,
                                                    blurRadius: 2)
                                              ]),
                                          child: getuser[0] == "admin"
                                              ? Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Radio(
                                                        value: getdata.waktu,
                                                        groupValue: _char,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            hari = getdata.hari;
                                                            print(value);
                                                            _char =
                                                                value as String;
                                                          });
                                                        },
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(getdata.waktu),
                                                          Text(getdata.hari),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      IconButton(
                                                          onPressed: () {
                                                            print(getdata.id);
                                                            setState(() {
                                                              jadwal.text = getdata.waktu;
                                                            });
                                                            showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.only(
                                                                          bottom: MediaQuery.of(context)
                                                                              .viewInsets
                                                                              .bottom),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          FormCommon(
                                                                              value: jadwal,
                                                                              title: "Edit Jadwal",
                                                                              hover: "Masukkan jadwal baru..."),
                                                                          Container(
                                                                            margin: EdgeInsets.only(left: 50,top: 20,right: 50,bottom: 20),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                ElevatedButton(onPressed: () {
                                                                                  // loadJadwal.getAllJadwal();
                                                                                  
                                                                               
                                                                                  loadJadwal.editJadwalPoliData(jadwal.text,getdata.id);
                                                                               
                                                                                    
                                                                                }, child: Text("Batal")),
                                                                                Spacer(),
                                                                                ElevatedButton(onPressed: () {
                                                                                  // loadJadwal.editJadwalPoliData(jadwal.text,loadJadwal.allDataJadwal[]);
                                                                                }, child: Text("Simpan"))
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          icon:
                                                              Icon(Icons.edit)),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              : ListTile(
                                                  title: Text(getdata.waktu),
                                                  subtitle: Text(getdata.hari),
                                                  trailing:
                                                      Icon(Icons.arrow_right),
                                                  leading: Radio(
                                                    value: getdata.waktu,
                                                    groupValue: _char,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        hari = getdata.hari;
                                                        print(value);
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
                        ),
                      ],
                    );
                  }
                })),
              ),
              Visibility(
                visible: getuser[0] == "admin" ? false : true,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 340,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 206, 75, 191),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (_char == "") {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PopupWarning(
                                  pesan: "Pilih Jadwal terlebih dahulu !");
                            });
                      } else {
                        print("jam : $_char");
                        print("hari : $hari");
                        print(DateTime.now().millisecond);
                        String abjad = '';
                        setState(() {
                          if (getNamaPoli == "Poli Umum") {
                            abjad = "U";
                          } else if (getNamaPoli == "Poli Gigi") {
                            abjad = "G";
                          } else if (getNamaPoli == "Poli Lansia") {
                            abjad = "L";
                          } else if (getNamaPoli == "Poli Gizi") {
                            abjad = "Z";
                          } else if (getNamaPoli == "Poli Sanitasi") {
                            abjad = "S";
                          } else if (getNamaPoli == "Poli Kia") {
                            abjad = "K";
                          } else {
                            print("Salah");
                          }
                        });

                        String urutan = "$abjad${DateTime.now().millisecond}";
                        List jadwalPilihan = [_char, hari, urutan];
                        loadJadwal.getUserJadwal(jadwalPilihan);
                        loadJadwal.addDataUserJadwal();
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
              ),
            ]),
          ),
        ));
  }
}
