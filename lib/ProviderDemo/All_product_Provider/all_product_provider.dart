
import 'package:ecommerceshope/API_All_ModelClass/all_product_model.dart';
import 'package:ecommerceshope/API_Integration_All/for_all_product.dart';
import 'package:flutter/material.dart';

class AllProductProvider with ChangeNotifier{

  static bool isLoading = false;
  List<AllProductData> allproductlist = [];

  getAllProducts(context) async {
    allproductlist = await CustomHttpRequest.getAllProducts(context);
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

  getMoreProducts(context,page) async {
    print('getMore');
    List<AllProductData> moreproductlist = await CustomHttpRequest.getMoreProducts(context,page);
    allproductlist.addAll(moreproductlist);
    print('getMore${allproductlist.length}');
    notifyListeners();
  }

  int _count = 0;
  int get count => _count;

  void increasesetcounnt(){
    _count++;
    notifyListeners();
  }
  void decreasesetcounnt(){
    _count--;
    notifyListeners();
  }

  void clearCart(){
    count==0;
  }

}