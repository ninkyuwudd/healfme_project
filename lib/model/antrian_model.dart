import 'dart:convert';

Antrian AntrianFromJson(String str) => Antrian.fromJson(json.decode(str));

String AntrianToJson(Antrian data) => json.encode(data.toJson());

class Antrian {
  String id;
    String alamat;
    String gender;
    String iduser;
    String nama;
    String nik;
    String nomerAntrian;
    String nomerPenjamin;
    String penjamin;
    String usia;

    Antrian({
      required this.id,
        required this.alamat,
        required this.gender,
        required this.iduser,
        required this.nama,
        required this.nik,
        required this.nomerAntrian,
        required this.nomerPenjamin,
        required this.penjamin,
        required this.usia,
    });

    factory Antrian.fromJson(Map<String, dynamic> json) => Antrian(
        
        id: json["id"],
        alamat: json["alamat"],
        gender: json["gender"],
        iduser: json["iduser"],
        nama: json["nama"],
        nik: json["nik"],
        nomerAntrian: json["nomer_antrian"],
        nomerPenjamin: json["nomer_penjamin"],
        penjamin: json["penjamin"],
        usia: json["usia"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "alamat": alamat,
        "gender": gender,
        "iduser": iduser,
        "nama": nama,
        "nik": nik,
        "nomer_antrian": nomerAntrian,
        "nomer_penjamin": nomerPenjamin,
        "penjamin": penjamin,
        "usia": usia,
    };
}