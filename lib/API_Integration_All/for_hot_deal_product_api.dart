import 'package:dio/dio.dart';

import '../API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';

class Custom_Api_In{
  static fetchHotDeals() async {
    try {
      Response response = await Dio().get("https://bornonbd.com/api/hot-deal-product");
      print(response.data);
      if (response.statusCode == 200) {
        var getHotDealsData = response.data["data"]["data"] as List;
        var listHotDeals = getHotDealsData.map((data) => ProductList.fromJson(data)).toList();
        print(listHotDeals);
        return listHotDeals;
      } else {
        throw Exception("‘Failed to load users’");
          }
        } catch (e) {
      print(e);
    }
  }
}