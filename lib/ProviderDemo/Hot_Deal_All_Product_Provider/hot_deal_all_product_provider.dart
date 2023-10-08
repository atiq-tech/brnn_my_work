import 'package:ecommerceshope/API_Integration_All/for_hot_deal_product_api.dart';
import 'package:flutter/cupertino.dart';

import '../../API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';

class Hot_Deal_All_Product_Provider with ChangeNotifier{
  List<ProductList> hotDealProductList=[];


  getHotDeals(context) async {
    hotDealProductList = await Custom_Api_In.fetchHotDeals();
    notifyListeners();
  }

}