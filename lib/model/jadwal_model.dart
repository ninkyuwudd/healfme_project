import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    String nama;
    List<JadwalPoli> jadwalPoli;

    Users({
        required this.nama,
        required this.jadwalPoli,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        nama: json["nama"],
        jadwalPoli: List<JadwalPoli>.from(json["jadwalPoli"].map((x) => JadwalPoli.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "jadwalPoli": List<dynamic>.from(jadwalPoli.map((x) => x.toJson())),
    };
}

class JadwalPoli {
  String id;
    String hari;
    String waktu;

    JadwalPoli({
      required this.id,
        required this.hari,
        required this.waktu,
    });

    factory JadwalPoli.fromJson(Map<String, dynamic> json) => JadwalPoli(
        id: json["id"],
        hari: json["hari"],
        waktu: json["waktu"],
    );

    Map<String, dynamic> toJson() => {
      "id" : id,
        "hari": hari,
        "waktu": waktu,
    };
}