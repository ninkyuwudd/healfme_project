import 'package:flutter/material.dart';
import 'package:healthproject/provider/antrian_provider.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../provider/jadwalPoli_provider.dart';

class GetAntrian extends StatefulWidget {
  static const routename = "/getAntrian";
  const GetAntrian({super.key});

  @override
  State<GetAntrian> createState() => _GetAntrianState();
}

class _GetAntrianState extends State<GetAntrian> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var loaduser = Provider.of<UserProvider>(context,listen: false);
    var getuser = loaduser.getUserData;
    print("id: ${getuser[6]}");

    Provider.of<AntrianProvider>(context, listen: false).fetchDataAntrian(getuser[6]);
  }

  @override
  Widget build(BuildContext context) {
    var loadAntri =  Provider.of<AntrianProvider>(context, listen: false);
    var getAntrian = loadAntri.antrian;

    // var loaduser = Provider.of<UserProvider>(context,listen: false);
    // var getuser = loaduser.getUserData;


    return Scaffold(
        appBar: AppBar(
          title: Text("test jadwal"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: getAntrian.length,
            itemBuilder: (context,idx){
              print(getAntrian.length);
              var antrian = getAntrian[idx];
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
                                          antrian.nomerAntrian,
                                          style: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    QrImageView(
                                      data: '''
${antrian.nama}
${antrian.usia}
${antrian.nik}
${antrian.gender} 
${antrian.alamat}
${antrian.penjamin}
${antrian.nomerPenjamin}
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
            }),
        )
        
        );
  }
}
