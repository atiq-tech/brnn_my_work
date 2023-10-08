import 'dart:convert';

import 'package:ecommerceshope/API_All_ModelClass/me/color_model.dart';

class OrderDetailsModel {
  final int id;
  final int customerId;
  final int productId;
  final int orderId;
  final String productName;
  final String price;
  final int quantity;
  final dynamic colorId;
  final dynamic sizeId;
  final String totalPrice;
  final dynamic fromName;
  final dynamic toName;
  final dynamic wpPrice;
  final dynamic message;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;
  final ColorModel? size;
  final ColorModel? color;

  OrderDetailsModel({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.orderId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.colorId,
    required this.sizeId,
    required this.totalPrice,
    required this.fromName,
    required this.toName,
    required this.wpPrice,
    required this.message,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.size,
    this.color,
  });

  factory OrderDetailsModel.fromJson(String str) => OrderDetailsModel.fromMap(json.decode(str));

  String fromJson() => json.encode(toMap());

  factory OrderDetailsModel.fromMap(Map<String, dynamic> json) => OrderDetailsModel(
    id: json["id"]??0,
    customerId: json["customer_id"]??0,
    productId: json["product_id"]??0,
    orderId: json["order_id"]??0,
    productName: json["product_name"]??'',
    price: json["price"]??'',
    quantity: json["quantity"]??0,
    colorId: json["color_id"],
    sizeId: json["size_id"],
    totalPrice: json["total_price"]??'',
    fromName: json["from_name"],
    toName: json["to_name"],
    wpPrice: json["wp_price"],
    message: json["message"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
    size: json["size"] == null ? null : ColorModel.fromMap(json["size"]),
    color: json["color"] == null ? null : ColorModel.fromMap(json["color"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "customer_id": customerId,
    "product_id": productId,
    "order_id": orderId,
    "product_name": productName,
    "price": price,
    "quantity": quantity,
    "color_id": colorId,
    "size_id": sizeId,
    "total_price": totalPrice,
    "from_name": fromName,
    "to_name": toName,
    "wp_price": wpPrice,
    "message": message,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "size": size?.toMap(),
    "color": color?.toMap(),
  };
}
