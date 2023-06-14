import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UsersAkun> _usrakun = [];
  List<UsersAkun> get akun => _usrakun;

  List getUserData = [];

  List dataPribadiUser = [];

  List ListDataPasien = [];

  bool daftar = false;

  var userid = "";

  insertDataSekarang(List data){
    getUserData = data;
    notifyListeners();
  }


  changeDaftarStatus(bool status){
    daftar = status;
    notifyListeners();
  }

  getDataPribadiUser(List data){
    dataPribadiUser = data;
    notifyListeners();
  }

  addDataPasien(){
    ListDataPasien.add(dataPribadiUser) ;
    notifyListeners();
  }


  void fethcdatauser() async {
    QuerySnapshot<Map<String, dynamic>> usrdataloc =
        await FirebaseFirestore.instance.collection('users').get();
        
    _usrakun = usrdataloc.docs
        .map((doc) => UsersAkun(
          id: doc.id,
            nama: doc['nama'],
            username: doc.data()['username'],
            email: doc.data()['email'],
            gender: doc.data()['gender'],
            phone: doc.data()['phone'],
            password: doc.data()['password'],
            gambar: doc.data()['gambar']
            ))
        .toList();
        notifyListeners();
  }

  changeid(String id){
    userid = id;
    notifyListeners();
  }


  void getiduser() async {
    DocumentReference doc_ref= await FirebaseFirestore.instance.collection('users').doc();

    DocumentSnapshot docSnap = await doc_ref.get();
    userid = docSnap.reference.id;
    notifyListeners();
  }


}
