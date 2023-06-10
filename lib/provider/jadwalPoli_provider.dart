



import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/jadwal_model.dart';
import 'package:http/http.dart' as http;

class JadwalProvider with ChangeNotifier{
  List<Users>? _dataJadwalPoli = [];
  List<Users>? get jadwalPoli => _dataJadwalPoli;

  List pilihanJadwal = [];


  getUserJadwal(List userjadwal){
    pilihanJadwal = userjadwal;
    notifyListeners();
  }


  Future<void> getJadwalPolidata(String poli,String hari) async{
    final url = "https://express-server-production-8525.up.railway.app/jadwal/getJadwalByPoliByDay?poli=$poli&day=$hari";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200){
      final jsonData = json.decode(response.body);
      final jadwalPoli = jsonData['data'] as List<dynamic>;
      final List<Users> loadedJadwalPoli = [];

      jadwalPoli.forEach((element) {
        loadedJadwalPoli.add(Users.fromJson(element));
       });

      _dataJadwalPoli = loadedJadwalPoli;
      print(jsonData["data"]);
      notifyListeners();
    }
    else{
      throw Exception("failed to load jadwalpoli data");
    }

  }

}









// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:healthproject/model/jadwalpoli_model.dart';
// import 'package:http/http.dart' as http;

// class getWaktuProvider extends ChangeNotifier{
//   // List<PoliGigi> waktuValue = [];
//   List<PoliGigi> _namapoli = [];
//   List<PoliGigi> get namPoli => _namapoli;
//   bool _isloading = false;
//   bool get isLoading => _isloading;
//   String _errormessage = '';
//   String get errorMessage => _errormessage;


// Future<void> fetchData() async {
//   _isloading = true;
//   notifyListeners();
//     try {
//       final response = await http.get(Uri.parse('https://express-server-production-8525.up.railway.app/jadwal/getJadwalByPoli?poli=Poli Gigi'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         _namapoli = (data['data'] as List).map((dt) => PoliGigi.fromJson(dt)
//           ).toList();
//           notifyListeners();
//       } else {
//         throw Exception('Failed to fetch data');
//       }
//     } catch (error) {
//       throw Exception('Failed to fetch data: $error');
//     }

//     _isloading = false;
//     notifyListeners();
//   }
// }



  // Future<void> fetchDataWaktu()async{
  //   try{
  //     final response =  await http.get(Uri.parse("https://express-server-production-8525.up.railway.app/jadwal/getJadwalByPoli?poli=Poli%20Gigi"));

  //     if(response.statusCode == 200){
  //       final data = json.decode(response.body);
  //       Poli namapoli = Poli.fromJson(data);
  //       waktuValue = namapoli.jadwalPoli?.map((jadwal) => jadwal.hari).toList();
  //     }
  //     else{
  //       throw Exception('failed to fetch data');
  //     }
  //   }catch(e){
  //     throw Exception('failed to fetch data: $e');
  //   }
  // }


  // Future<void> fetchDatapoli() async {
  //   try {
  //     final response = await http.get(Uri.parse('https://express-server-production-8525.up.railway.app/jadwal/getJadwalByPoli?poli=Poli%20Gigi'));

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       namapoli = (data['data'] as List).map((dt) => PoliGigi(
  //         nama: dt['nama'])
  //         ).toList();
  //         notifyListeners();
  //     } else {
  //       throw Exception('Failed to fetch data');
  //     }
  //   } catch (error) {
  //     throw Exception('Failed to fetch data: $error');
  //   }
  // }
