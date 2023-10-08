import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';

class CustomApiTrending{

  static fetchTrending() async {
    try {
      Response response = await Dio().get("https://bornonbd.com/api/trending");
      print(response.data);
      if (response.statusCode == 200) {
        var getHotDealsData = response.data["data"] as List;
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