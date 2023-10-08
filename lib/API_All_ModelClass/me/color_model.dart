import 'dart:convert';

class ColorModel {
  final int id;
  final String name;
  final String code;
  final String createdAt;
  final String updatedAt;

  ColorModel({
    required this.id,
    required this.name,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ColorModel.fromJson(String str) => ColorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ColorModel.fromMap(Map<String, dynamic> json) => ColorModel(
    id: json["id"]??0,
    name: json["name"]??'',
    code: json["code"]??'',
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "code": code,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
