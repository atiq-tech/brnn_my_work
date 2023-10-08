// To parse this JSON data, do
//
//     final similarProduct = similarProductFromJson(jsonString);

import 'dart:convert';

class SimilarProduct {
  final int id;
  final String productCode;
  final String name;
  final String slug;
  final String model;
  final int price;
  final String simillarPorduct;
  final dynamic similarDiscount;
  final String sizeId;
  final String colorId;
  final int categoryId;
  final int subCategoryId;
  final int subsubcategoryId;
  final int anotherCategoryId;
  final int brandId;
  final dynamic discount;
  final String shortDetails;
  final dynamic description;
  final String mainImage;
  final String thumbImage;
  final String smallImage;
  final String sizeguide;
  final dynamic isFeature;
  final dynamic isCollectionTitle1;
  final String isCollectionTitle2;
  final dynamic isDeal;
  final dynamic isTailoring;
  final dynamic tailoringCharge;
  final dynamic isTrending;
  final String newArrival;
  final dynamic dealStart;
  final dynamic dealEnd;
  final String rewardPoint;
  final int status;
  final int quantity;
  final String saveBy;
  final dynamic updateBy;
  final String ipAddress;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;
  final String currencyAmount;

  SimilarProduct({
    required this.id,
    required this.productCode,
    required this.name,
    required this.slug,
    required this.model,
    required this.price,
    required this.simillarPorduct,
    this.similarDiscount,
    required this.sizeId,
    required this.colorId,
    required this.categoryId,
    required this.subCategoryId,
    required this.subsubcategoryId,
    required this.anotherCategoryId,
    required this.brandId,
    this.discount,
    required this.shortDetails,
    this.description,
    required this.mainImage,
    required this.thumbImage,
    required this.smallImage,
    required this.sizeguide,
    this.isFeature,
    this.isCollectionTitle1,
    required this.isCollectionTitle2,
    this.isDeal,
    this.isTailoring,
    this.tailoringCharge,
    this.isTrending,
    required this.newArrival,
    this.dealStart,
    this.dealEnd,
    required this.rewardPoint,
    required this.status,
    required this.quantity,
    required this.saveBy,
    this.updateBy,
    required this.ipAddress,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.currencyAmount,
  });

  factory SimilarProduct.fromJson(String str) => SimilarProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SimilarProduct.fromMap(Map<String, dynamic> json) => SimilarProduct(
    id: json["id"] ?? 0,
    productCode: json["product_code"] ?? '',
    name: json["name"] ?? '',
    slug: json["slug"] ?? '',
    model: json["model"] ?? '',
    price: json["price"] ?? 0,
    simillarPorduct: json["simillar_porduct"] ?? '',
    similarDiscount: json["similar_discount"],
    sizeId: json["size_id"] ?? '',
    colorId: json["color_id"] ?? '',
    categoryId: json["category_id"] ?? 0,
    subCategoryId: json["sub_category_id"] ?? 0,
    subsubcategoryId: json["subsubcategory_id"] ?? 0,
    anotherCategoryId: json["another_category_id"] ?? 0,
    brandId: json["brand_id"] ?? 0,
    discount: json["discount"],
    shortDetails: json["short_details"] ?? '',
    description: json["description"],
    mainImage: json["main_image"] ?? '',
    thumbImage: json["thumb_image"] ?? '',
    smallImage: json["small_image"] ?? '',
    sizeguide: json["sizeguide"] ?? '',
    isFeature: json["is_feature"],
    isCollectionTitle1: json["is_collection_title_1"],
    isCollectionTitle2: json["is_collection_title_2"] ?? '',
    isDeal: json["is_deal"],
    isTailoring: json["is_tailoring"],
    tailoringCharge: json["tailoring_charge"],
    isTrending: json["is_trending"],
    newArrival: json["new_arrival"] ?? '',
    dealStart: json["deal_start"],
    dealEnd: json["deal_end"],
    rewardPoint: json["reward_point"] ?? '',
    status: json["status"] ?? 0,
    quantity: json["quantity"] ?? 0,
    saveBy: json["save_by"] ?? '',
    updateBy: json["update_by"],
    ipAddress: json["ip_address"] ?? '',
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] ?? '',
    updatedAt: json["updated_at"] ?? '',
    currencyAmount: json["currency_amount"] ?? '',
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_code": productCode,
    "name": name,
    "slug": slug,
    "model": model,
    "price": price,
    "simillar_porduct": simillarPorduct,
    "similar_discount": similarDiscount,
    "size_id": sizeId,
    "color_id": colorId,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "subsubcategory_id": subsubcategoryId,
    "another_category_id": anotherCategoryId,
    "brand_id": brandId,
    "discount": discount,
    "short_details": shortDetails,
    "description": description,
    "main_image": mainImage,
    "thumb_image": thumbImage,
    "small_image": smallImage,
    "sizeguide": sizeguide,
    "is_feature": isFeature,
    "is_collection_title_1": isCollectionTitle1,
    "is_collection_title_2": isCollectionTitle2,
    "is_deal": isDeal,
    "is_tailoring": isTailoring,
    "tailoring_charge": tailoringCharge,
    "is_trending": isTrending,
    "new_arrival": newArrival,
    "deal_start": dealStart,
    "deal_end": dealEnd,
    "reward_point": rewardPoint,
    "status": status,
    "quantity": quantity,
    "save_by": saveBy,
    "update_by": updateBy,
    "ip_address": ipAddress,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "currency_amount": currencyAmount,
  };
}
