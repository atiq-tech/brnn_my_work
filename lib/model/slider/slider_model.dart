import 'dart:convert';

class SliderModel {
  final List<Datum> data;

  SliderModel({
    required this.data,
  });

  factory SliderModel.fromJson(String str) => SliderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SliderModel.fromMap(Map<String, dynamic> json) => SliderModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String image;

  Datum({
    required this.image,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "image": image,
  };
}
