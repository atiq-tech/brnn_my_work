
import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:ecommerceshope/API_Integration_All/for_trending_product.dart';
import 'package:flutter/material.dart';

class TrendingProduct with ChangeNotifier{
  List<ProductList> trendingProductList=[];

  getTrending(context) async {
    trendingProductList = await CustomApiTrending.fetchTrending();
    notifyListeners();
  }

}