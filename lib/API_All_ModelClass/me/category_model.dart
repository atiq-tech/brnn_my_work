import 'dart:convert';

class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String details;
  final String image;
  final String thumbimage;
  final String smallimage;
  final String status;
  final dynamic isHomepage;
  final dynamic isMenu;
  final String saveBy;
  final dynamic updatedBy;
  final String ipAddress;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.details,
    required this.image,
    required this.thumbimage,
    required this.smallimage,
    required this.status,
    required this.isHomepage,
    required this.isMenu,
    required this.saveBy,
    required this.updatedBy,
    required this.ipAddress,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    slug: json["slug"] ?? '',
    details: json["details"] ?? '',
    image: json["image"] ?? '',
    thumbimage: json["thumbimage"] ?? '',
    smallimage: json["smallimage"] ?? '',
    status: json["status"] ?? '',
    isHomepage: json["is_homepage"],
    isMenu: json["is_menu"],
    saveBy: json["save_by"] ?? '',
    updatedBy: json["updated_by"],
    ipAddress: json["ip_address"] ?? '',
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] ?? '',
    updatedAt: json["updated_at"] ?? '',
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "slug": slug,
    "details": details,
    "image": image,
    "thumbimage": thumbimage,
    "smallimage": smallimage,
    "status": status,
    "is_homepage": isHomepage,
    "is_menu": isMenu,
    "save_by": saveBy,
    "updated_by": updatedBy,
    "ip_address": ipAddress,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
