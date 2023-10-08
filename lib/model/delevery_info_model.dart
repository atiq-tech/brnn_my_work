import 'dart:convert';

class DeliveryInfoModel {
  final List<CashOnDeliveryModel> cashOnDelivery;
  final List<CourierModel> courierModel;

  DeliveryInfoModel({
    required this.cashOnDelivery,
    required this.courierModel,
  });

  factory DeliveryInfoModel.fromJson(String str) => DeliveryInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeliveryInfoModel.fromMap(Map<String, dynamic> json) => DeliveryInfoModel(
    cashOnDelivery: List<CashOnDeliveryModel>.from(json["delivery_charge"].map((x) => CashOnDeliveryModel.fromMap(x))),
    courierModel: List<CourierModel>.from(json["courier"].map((x) => CourierModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "delivery_charge": List<dynamic>.from(cashOnDelivery.map((x) => x.toMap())),
    "courier": List<dynamic>.from(courierModel.map((x) => x.toMap())),
  };
}

class CashOnDeliveryModel {
  final int id;
  final dynamic districtId;
  final String charge;
  final String area;
  final String createdAt;
  final String updatedAt;

  CashOnDeliveryModel({
    required this.id,
    required this.districtId,
    required this.charge,
    required this.area,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CashOnDeliveryModel.fromJson(String str) => CashOnDeliveryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CashOnDeliveryModel.fromMap(Map<String, dynamic> json) => CashOnDeliveryModel(
    id: json["id"]??0,
    districtId: json["district_id"],
    charge: json["charge"]??'',
    area: json["area"]??'',
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "district_id": districtId,
    "charge": charge,
    "area": area,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class CourierModel {
  final int id;
  final String name;
  final String link;
  final String details;
  final String status;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;

  CourierModel({
    required this.id,
    required this.name,
    required this.link,
    required this.details,
    required this.status,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourierModel.fromJson(String str) => CourierModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourierModel.fromMap(Map<String, dynamic> json) => CourierModel(
    id: json["id"]??0,
    name: json["name"]??'',
    link: json["link"]??'',
    details: json["details"]??'',
    status: json["status"]??'',
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "link": link,
    "details": details,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
