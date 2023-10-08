import 'package:ecommerceshope/API_Integration_All/for_all_category.dart';
import 'package:ecommerceshope/API_Integration_All/get_wishlist_api.dart';
import 'package:ecommerceshope/model/wishlist_model/wishlist_model.dart';
import 'package:flutter/cupertino.dart';

import '../../API_All_ModelClass/subCategorymodel_class/subcategorymodel.dart';

class GetWishListProvider with ChangeNotifier{

  static bool isLoading = false;

  List<WishListModel> wishList = [];

  getWishList(context) async {
    wishList = await WishListApi.fetchWishList(context);
    off();
    notifyListeners();
  }
  off(){
    Future.delayed(Duration(seconds: 1),() {
      print('offff');
      isLoading = false;
      notifyListeners();
    },);
  }
  on(){
    print('onnn');
    isLoading = true;
    notifyListeners();
  }
}