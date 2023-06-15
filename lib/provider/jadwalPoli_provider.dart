import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/jadwal_model.dart';
import 'package:http/http.dart' as http;

class JadwalProvider with ChangeNotifier {
  List<Users>? _dataJadwalPoli = [];
  List<Users>? get jadwalPoli => _dataJadwalPoli;

  List pilihanJadwal = [];

  List daftarOrderJadwal = [];

  List<JadwalPoli> allDataJadwal = [];

  getUserJadwal(List userjadwal) {
    pilihanJadwal = userjadwal;
    notifyListeners();
  }

  addDataUserJadwal() {
    daftarOrderJadwal.add(pilihanJadwal);
    notifyListeners();
  }

  Future<void> createJadwalPoli(String hari, String jadwal, String poli) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://express-server-production-8525.up.railway.app/jadwal/createJadwal'));
    // request.body =
    //     '''{\r\n  "hari" : "Senin",\r\n  "waktu" : "10:00 - 11:30",\r\n  "nama" : "Poli Umum"\r\n}\r\n\r\n}''';
    request.body = json.encode({"hari": hari, "waktu": jadwal, "nama": poli});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> editJadwalPoliData(String jadwal, String id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://express-server-production-8525.up.railway.app/jadwal/updateJadwal/$id'));
    request.body = json.encode({"waktu": jadwal});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> deleteJadwalPoli(String id) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'https://express-server-production-8525.up.railway.app/jadwal/delJadwal/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    notifyListeners();
  }

  Future<void> getJadwalPolidata(String poli, String hari) async {
    final url =
        "https://express-server-production-8525.up.railway.app/jadwal/getJadwalByPoliByDay?poli=$poli&day=$hari";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final jadwalPoli = jsonData['data'] as List<dynamic>;
      final List<Users> loadedJadwalPoli = [];

      jadwalPoli.forEach((element) {
        loadedJadwalPoli.add(Users.fromJson(element));
      });

      _dataJadwalPoli = loadedJadwalPoli;
      print(jsonData["data"]);
      notifyListeners();
    } else {
      throw Exception("failed to load jadwalpoli data");
    }
  }

  Future<void> getAllJadwal() async {
    final url =
        "https://express-server-production-8525.up.railway.app/jadwal/getJadwal";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final jadwalPoli = jsonData['data'] as List<dynamic>;
      final List<JadwalPoli> loadedAllJadwal = [];

      jadwalPoli.forEach((element) {
        loadedAllJadwal.add(JadwalPoli.fromJson(element));
      });

      allDataJadwal = loadedAllJadwal;
      print(jsonData["data"]);
      notifyListeners();
    } else {
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
