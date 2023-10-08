import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:ecommerceshope/API_Integration_All/for_new_arrivel.dart';
import 'package:flutter/cupertino.dart';

class NewArrivelProvider with ChangeNotifier{
  List<ProductList> NewArrivelProductList=[];

  getCategories(context) async {
    NewArrivelProductList = await  Custom_Api_NewArrivel.fatchnewarrivel();
    notifyListeners();
  }
}