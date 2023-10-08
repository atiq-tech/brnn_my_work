
import 'package:ecommerceshope/API_All_ModelClass/me/product_details_model.dart';
import 'package:ecommerceshope/API_Integration_All/for_trending_product.dart';
import 'package:ecommerceshope/API_Integration_All/product_details.dart';
import 'package:flutter/material.dart';

class ProductDetails with ChangeNotifier{

  ProductDetailsModel? productDetailsModel;

  Future<ProductDetailsModel?>getProductDetails(context, id) async {
    productDetailsModel = await CustomApiProductDetails.fetchProductDetails(id);
    return productDetailsModel;
  }

}