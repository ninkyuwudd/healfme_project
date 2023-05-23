
import 'dart:convert';

ApotekModel ApotekModelFromJson(String str) => ApotekModel.fromJson(json.decode(str));

String ApotekModelToJson(ApotekModel data) => json.encode(data.toJson());

class ApotekModel {
    String id;
    double lat;
    double long;
    String name;
    String detail;

    ApotekModel({
        required this.id,
        required this.lat,
        required this.long,
        required this.name,
        required this.detail
    });

    factory ApotekModel.fromJson(Map<String, dynamic> json) => ApotekModel(
        id: json["id"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        name: json["name"],
        detail: json["detail"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "long": long,
        "name": name,
        "detail" : detail
    };
}