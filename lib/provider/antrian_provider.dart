


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/model/antrian_model.dart';

class AntrianProvider extends ChangeNotifier {

  List<Antrian> _usrAntrian = [];
  List<Antrian> get antrian => _usrAntrian;



  void fetchDataAntrian(String id) async {
    print("id sekarang: $id");
    QuerySnapshot<Map<String,dynamic>> dataAntrian = await FirebaseFirestore.instance.collection('Antrian').where("iduser",isEqualTo: "$id").get();

    _usrAntrian = dataAntrian.docs.map((doc) => Antrian(
      id: doc.id,
      alamat: doc.data()["alamat"], 
      gender: doc.data()["gender"], 
      iduser: doc.data()["iduser"], 
      nama: doc.data()["nama"], 
      nik: doc.data()["nik"], 
      nomerAntrian: doc.data()["nomer_antrian"], 
      nomerPenjamin: doc.data()["nomer_penjamin"], 
      penjamin: doc.data()["penjamin"], 
      usia: doc.data()["usia"])).toList();
      notifyListeners();
  }


}