import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_details_model.dart';

class CustomApiProductDetails{

  static fetchProductDetails(id) async {
    print("asfasfasfasdsfsd${id}");
    try {
      Response response = await Dio().get("https://bornonbd.com/api/product-details/$id");
      print("asfasfasfasdsfsd${response.data}");
      print("asfasfasfas${response.statusCode}");
      if (response.statusCode == 200) {
        // var getHotDealsData = response.data["data"];
        var listHotDeals = ProductDetailsModel.fromMap(response.data["data"]);
        print("jksdhfjkaf $listHotDeals");
        return listHotDeals;
      } else {
        throw Exception("‘Failed to load users’");
      }
    } catch (e) {
      print(e);
    }
  }
}