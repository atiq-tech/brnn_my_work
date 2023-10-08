import 'package:ecommerceshope/API_All_ModelClass/all_category_model_class.dart';
import 'package:ecommerceshope/API_Integration_All/for_all_category.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier{

   List<Data> allproductlist = [];
   // getCategories(context) async {
   //    allproductlist = await CustomHtttpRequest.getOrder(context);
   //    notifyListeners();
   // }

   int _count=0;
   int get count=>_count;
   void increasecount(){
      _count++;
      notifyListeners();
   }

}