import 'package:flutter/material.dart';
import 'package:healthproject/provider/getfoto_provider.dart';
import 'package:provider/provider.dart';

import '../widget/daftar/btn_takefoto.dart';

class UnggahKtpBpjs extends StatefulWidget {
  const UnggahKtpBpjs({super.key});

  @override
  State<UnggahKtpBpjs> createState() => _UnggahKtpBpjsState();
}

class _UnggahKtpBpjsState extends State<UnggahKtpBpjs> {
  
  @override
  Widget build(BuildContext context) {
    var loadbpjs = Provider.of<Getfoto>(context).imageBpjs;
    var loadktp = Provider.of<Getfoto>(context).imageKtp;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image(
          image: AssetImage("images/logodaftar.png"),
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Pendaftaran Poli Umum",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              BtnTakeFoto(judul: "Bpjs",),
              BtnTakeFoto(judul: "Ktp",),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 40),
                  ),
                onPressed: (){
                  print(loadbpjs);
                  print(loadktp);
              }, child: const Text("Kirim"))
            ],
          ),
        ),
      ),
    );
  }
}