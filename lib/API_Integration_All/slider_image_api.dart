import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/slider/slider_model.dart';

import '../API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';

class SliderApiList{
  static getSliderImage() async {
    try {
      Response response = await Dio().get("https://bornonbd.com/api/slider");
      print("asjklfhasjkdfhksf ${response.data}");
      if (response.statusCode == 200) {
        var getHotDealsData = response.data["data"] as List;
        var listHotDeals = getHotDealsData.map((data) => Datum.fromMap(data)).toList();
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