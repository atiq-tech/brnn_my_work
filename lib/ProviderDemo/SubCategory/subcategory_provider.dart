 import 'package:ecommerceshope/API_Integration_All/for_all_category.dart';
import 'package:flutter/cupertino.dart';

import '../../API_All_ModelClass/subCategorymodel_class/subcategorymodel.dart';

class Sub_Category_Provider with ChangeNotifier{
  List<Data> allproductlist = [];

  Future<List<Data>>getCategories(context) async {
    allproductlist = await CustomHttprequesttt.fetchUsers();
    // notifyListeners();
    return allproductlist;
  }
}