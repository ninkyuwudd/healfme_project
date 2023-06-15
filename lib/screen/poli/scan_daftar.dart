import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class QrScanPage extends StatefulWidget {
  static const routename = "/qrscan";
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
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
