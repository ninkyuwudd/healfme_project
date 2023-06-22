import 'package:flutter/material.dart';
import 'package:healthproject/provider/getfoto_provider.dart';
import 'package:healthproject/provider/pilihfile_controller.dart';
import 'package:healthproject/provider/user_repo.dart';
import 'package:healthproject/screen/poli/ringkasan.dart';
import 'package:healthproject/widget/popup_warning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../widget/daftar/btn_takefoto.dart';

class UnggahKtpBpjs extends StatefulWidget {
  static const routename = '/unggahbpjs';
  const UnggahKtpBpjs({super.key});

  @override
  State<UnggahKtpBpjs> createState() => _UnggahKtpBpjsState();
}

class _UnggahKtpBpjsState extends State<UnggahKtpBpjs> {
  
  @override
  Widget build(BuildContext context) {
    var loadgetfile = Provider.of<PilihUploadfile>(context);
    var loaduser = Provider.of<UserProvider>(context);
    var loadgetfoto = Provider.of<Getfoto>(context);
    var getNameBpjs = loadgetfoto.namebpjs;
    var getNameKtp = loadgetfoto.namektp;
    var loadbpjs = loadgetfoto.imageBpjs;
    var loadktp = loadgetfoto.imageKtp;
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
              Text("Pendaftaran Poli",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              BtnTakeFoto(judul: "Bpjs",),
              BtnTakeFoto(judul: "Ktp",),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 50, 40),
                  ),
                onPressed: (){
                  print(loadbpjs);
                  print(loadktp);
                  if(loadbpjs == null || loadktp == null){
                    showDialog(context: context, builder: (context){
                      return PopupWarning(pesan: "Gambar tidak boleh kosong !");
                    });
                  }else{
                    showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text("Apakah data anda sudah benar?"),
                    content: Text("Data yang telah diinput kan tidak bisa diubah lagi"),
                    actions: [
                      ElevatedButton(onPressed: (){
                     
                        loadgetfoto.uploadImageToFirebasebpjs(loaduser.getUserData[0].toString(),loadbpjs,getNameBpjs);
                        loadgetfoto.uploadImageToFirebasebpjs(loaduser.getUserData[0].toString(), loadktp,getNameKtp);

                        loaduser.changeDaftarStatus(true);
                        setState(() {
                          loadbpjs = null;
                          loadktp = null;
                        });
                        Navigator.pushReplacementNamed(context, Ringkasan.routename);
                      }, child: Text("Ya")),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Tidak"))
                    ],

                  ));
                }
                  
              }, child: const Text("Kirim"))
            ],
          ),
        ),
      ),
    );
  }
}