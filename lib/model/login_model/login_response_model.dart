import 'dart:convert';

class LoginResponseModel {
  final Token? token;
  final Customer? customer;
  final String? success;
  final String? error;

  LoginResponseModel({
    this.token,
    this.customer,
    this.success,
    this.error,
  });

  factory LoginResponseModel.fromJson(String str) => LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
    token: json["token"] == null ? null : Token.fromMap(json["token"]),
    customer: json["customer"] == null ? null : Customer.fromMap(json["customer"]),
    success: json["success"]??'',
    error: json["error"]??'',
  );

  Map<String, dynamic> toMap() => {
    "token": token?.toJson(),
    "customer": customer?.toJson(),
    "success": success,
    "error": error,
  };
}

class Customer {
  final int id;
  final String code;
  final String name;
  final String phone;
  final dynamic email;
  final String address;
  final dynamic countryId;
  final dynamic districtId;
  final dynamic upazilaId;
  final dynamic areaId;
  final dynamic profilePicture;
  final dynamic thumPicture;
  final String username;
  final String status;
  final dynamic membershipDiscount;
  final String saveBy;
  final String updatedBy;
  final dynamic deletedAt;
  final String ipAddress;
  final String createdAt;
  final String updatedAt;
  final String message;

  Customer({
    required this.id,
    required this.code,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.countryId,
    required this.districtId,
    required this.upazilaId,
    required this.areaId,
    required this.profilePicture,
    required this.thumPicture,
    required this.username,
    required this.status,
    required this.membershipDiscount,
    required this.saveBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.ipAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.message,
  });

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
    id: json["id"]??0,
    code: json["code"]??'',
    name: json["name"]??'',
    phone: json["phone"]??'',
    email: json["email"],
    address: json["address"]??'',
    countryId: json["country_id"],
    districtId: json["district_id"],
    upazilaId: json["upazila_id"],
    areaId: json["area_id"],
    profilePicture: json["profile_picture"],
    thumPicture: json["thum_picture"],
    username: json["username"]??'',
    status: json["status"]??'',
    membershipDiscount: json["membership_discount"],
    saveBy: json["save_by"]??'',
    updatedBy: json["updated_by"]??'',
    deletedAt: json["deleted_at"],
    ipAddress: json["ip_address"]??'',
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
    message: json["message"]??'',
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "code": code,
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "country_id": countryId,
    "district_id": districtId,
    "upazila_id": upazilaId,
    "area_id": areaId,
    "profile_picture": profilePicture,
    "thum_picture": thumPicture,
    "username": username,
    "status": status,
    "membership_discount": membershipDiscount,
    "save_by": saveBy,
    "updated_by": updatedBy,
    "deleted_at": deletedAt,
    "ip_address": ipAddress,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "message": message,
  };
}

class Token {
  final Original original;
  Token({
    required this.original,
  });
  factory Token.fromJson(String str) => Token.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Token.fromMap(Map<String, dynamic> json) => Token(
    original: Original.fromMap(json["original"]),
  );

  Map<String, dynamic> toMap() => {
    "original": original.toJson(),
  };
}

class Original {
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  Original({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory Original.fromJson(String str) => Original.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Original.fromMap(Map<String, dynamic> json) => Original(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toMap() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
