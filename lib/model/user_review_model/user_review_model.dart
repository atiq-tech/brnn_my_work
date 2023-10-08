import 'dart:convert';

import 'package:ecommerceshope/model/login_model/login_response_model.dart';

class UserReviewModel {
  final int id;
  final int productId;
  final String customerId;
  final dynamic rate;
  final String customerName;
  final String customerEmail;
  final String review;
  final String status;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;
  final Customer? customer;

  UserReviewModel({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.rate,
    required this.customerName,
    required this.customerEmail,
    required this.review,
    required this.status,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.customer
  });

  factory UserReviewModel.fromJson(String str) => UserReviewModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserReviewModel.fromMap(Map<String, dynamic> json) => UserReviewModel(
    id: json["id"]??0,
    productId: json["product_id"]??0,
    customerId: json["customer_id"]??"",
    rate: json["rate"],
    customerName: json["customer_name"]??"",
    customerEmail: json["customer_email"]??"",
    review: json["review"]??"",
    status: json["status"]??"",
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
    customer: json["customer"] == null ? null : Customer.fromMap(json["customer"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "customer_id": customerId,
    "rate": rate,
    "customer_name": customerName,
    "customer_email": customerEmail,
    "review": review,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "customer": customer?.toMap(),
  };
}
