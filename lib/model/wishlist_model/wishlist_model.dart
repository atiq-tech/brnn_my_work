import 'package:ecommerceshope/API_All_ModelClass/me/color_model.dart';
import 'dart:convert';

class WishListModel {
  final int id;
  final int productId;
  final String customerId;
  final String createdAt;
  final String updatedAt;
  final WProduct product;

  WishListModel({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory WishListModel.fromJson(String str) => WishListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WishListModel.fromMap(Map<String, dynamic> json) => WishListModel(
    id: json["id"]??0,
    productId: json["product_id"]??'',
    customerId: json["customer_id"]??'',
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
    product: WProduct.fromMap(json["product"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "customer_id": customerId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "product": product.toMap(),
  };
}

class WProduct {
  final int id;
  final String productCode;
  final String name;
  final int price;
  final String colorId;
  final String sizeId;
  final String mainImage;
  final String thumbImage;
  final List<ColorModel>? size;
  final List<ColorModel>? color;
  final String currencyAmount;

  WProduct({
    required this.id,
    required this.productCode,
    required this.name,
    required this.price,
    required this.colorId,
    required this.sizeId,
    required this.mainImage,
    required this.thumbImage,
    this.size,
    this.color,
    required this.currencyAmount,
  });

  factory WProduct.fromJson(String str) => WProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WProduct.fromMap(Map<String, dynamic> json) => WProduct(
    id: json["id"]??0,
    productCode: json["product_code"]??'',
    name: json["name"]??'',
    price: json["price"]??0,
    mainImage: json["main_image"]??'',
    thumbImage: json["thumb_image"]??'',
    colorId: json["color_id"]??'',
    sizeId: json["size_id"]??'',
    size: json["size"] == [] ? [] : List<ColorModel>.from(json["size"].map((x) => ColorModel.fromMap(x))),
    color: json["color"] == [] ? [] : List<ColorModel>.from(json["color"].map((x) => ColorModel.fromMap(x))),
    currencyAmount: json["currency_amount"]??'',
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_code": productCode,
    "name": name,
    "price": price,
    "main_image": mainImage,
    "thumb_image": thumbImage,
    "color_id": colorId,
    "size_id": sizeId,
    "size": List<dynamic>.from(size!.map((x) => x.toMap())),
    "color": List<dynamic>.from(color!.map((x) => x.toMap())),
    "currency_amount": currencyAmount,
  };
}