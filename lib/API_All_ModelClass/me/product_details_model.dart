import 'dart:convert';

import 'package:ecommerceshope/API_All_ModelClass/me/color_model.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_model.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/similar_product.dart';

class ProductDetailsModel {
  final ProductModel productModel;
  final List<SimilarProduct> similerProduct;
  final List<ColorModel> color;
  final List<ColorModel> size;

  ProductDetailsModel({
    required this.productModel,
    required this.similerProduct,
    required this.color,
    required this.size,
  });

  factory ProductDetailsModel.fromJson(String str) => ProductDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDetailsModel.fromMap(Map<String, dynamic> json) => ProductDetailsModel(
    productModel: ProductModel.fromMap(json["product"]),
    similerProduct: json["similerProduct"] == null ? [] : List<SimilarProduct>.from(json["similerProduct"].map((x) => SimilarProduct.fromMap(x))),
    color: json["color"] == null ? [] : List<ColorModel>.from(json["color"].map((x) => ColorModel.fromMap(x))),
    size: json["size"] == null ? [] : List<ColorModel>.from(json["size"].map((x) => ColorModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "product": productModel.toJson(),
    "similerProduct": List<dynamic>.from(similerProduct.map((x) => x.toJson())),
    "color": List<dynamic>.from(color.map((x) => x.toJson())),
    "size": List<dynamic>.from(color.map((x) => x.toJson())),
  };
}