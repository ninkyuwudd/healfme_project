import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../provider/antrian_provider.dart';

class QrScanPage extends StatefulWidget {
  static const routename = "/qrscan";
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AntrianProvider>(context, listen: false).fetchDataAntrianAll();
  }
  String result = '';
  @override
  Widget build(BuildContext context) {
        var loadAntri =  Provider.of<AntrianProvider>(context, listen: false);
    var getAntrian = loadAntri.antrian;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                    for(var i = 0; i < getAntrian.length; i ++){
                      var idatnrian = getAntrian[i].id;
                      if(result.contains(idatnrian)){
                        print(idatnrian);
                        print("antrian sudah selesai");
                        loadAntri.deleteAtrian(idatnrian);
                        break;
                      }else{
                        print("masih gagal");
                      }
                    }
                  }
                });
              },
              child: const Text('Open Scanner'),
            ),
            Text("Data Pasien"),
            Container(
              padding: EdgeInsets.only(left: 5,right: 10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                  
                    color: Colors.black12,
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 2)
                  )
                ]
              ),
              child: Row(
                children: [
                  Text('''
            
            Nama        
            Umur        
            Nik         
            Gender      
            Alamat      
            Penjamin    
            No Penjamin 
            id
            '''),
                  Spacer(),
                  Text('$result'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Selesai"))
          ],
        ),
      ),
    );
  }
}
