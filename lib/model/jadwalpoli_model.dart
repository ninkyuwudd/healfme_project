
class Poli {
  String? nama;
  List<JadwalPoli>? jadwalPoli;

  Poli({this.nama, this.jadwalPoli});

  factory Poli.fromJson(Map<String, dynamic> json) {
    return Poli(
      nama: json['nama'],
      jadwalPoli: List<JadwalPoli>.from(json['jadwalPoli'].map((x) => JadwalPoli.fromJson(x))),
    );
  }
}

class JadwalPoli {
  String hari;
  String waktu;

  JadwalPoli({required this.hari,required this.waktu});

  factory JadwalPoli.fromJson(Map<String, dynamic> json) {
    return JadwalPoli(
      hari: json['hari'],
      waktu: json['waktu'],
    );
  }
}


class PoliGigi {
  String nama;
  final List<JadwalPoli> jadwalpoli;

  PoliGigi({required this.nama,required this.jadwalpoli});

  factory PoliGigi.fromJson(Map<String, dynamic> json) {
    return PoliGigi(
      nama: json['nama'],
      jadwalpoli: List<JadwalPoli>.from(json['jadwalPoli'].map((x) => JadwalPoli.fromJson(x))),
    );
  }

  Map<String,dynamic> toJson() => {
    "nama" : nama
  };
}