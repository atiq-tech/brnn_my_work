import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:ecommerceshope/API_Integration_All/for_all_featured.dart';
import 'package:flutter/cupertino.dart';

class FeaturedProduct with ChangeNotifier{
  List<ProductList> featuredProductList = [];

  getFeatured(context) async {
    featuredProductList = await CustomApiFeature.fetchFeatured();
    notifyListeners();
  }

}