import 'package:meta/meta.dart';
import 'dart:convert';

class OrderStoreModel {
  final String title;
  final String paymentType;
  final String customerPhone;
  final String orderOtpCode;
  final String id;
  final String invoice;
  final String totalAmount;

  OrderStoreModel({
    required this.title,
    required this.paymentType,
    required this.customerPhone,
    required this.orderOtpCode,
    required this.id,
    required this.invoice,
    required this.totalAmount,
  });

  factory OrderStoreModel.fromJson(String str) => OrderStoreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderStoreModel.fromMap(Map<String, dynamic> json) => OrderStoreModel(
    title: json["title"]??"",
    paymentType: json["paymentType"]??"",
    customerPhone: json["customerPhone"]??"",
    orderOtpCode: json["orderOtpCode"] is int ? json["orderOtpCode"].toString() : json["orderOtpCode"] ??"",
    id: json["id"] is int ? json["id"].toString() : json["id"] ??"",
    invoice: json["invoice"] is int? json["invoice"].toString() : json["invoice"] ??"",
    totalAmount: json["total_amount"]??"",
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "paymentType": paymentType,
    "customerPhone": customerPhone,
    "orderOtpCode": orderOtpCode,
    "id": id,
    "invoice": invoice,
    "total_amount": totalAmount,
  };
}
