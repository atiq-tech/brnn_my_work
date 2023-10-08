import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_details_model.dart';
import 'package:ecommerceshope/model/delevery_info_model.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryInfoApi{

  static fetchDeliveryInfo(context) async {

    try {
      const api = 'https://bornonbd.com/api/checkout';
      final dio = Dio();
      Response response = await dio.get(
        api,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "*/*",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );
      print("delllllllllllllll ${response.data['data']}");

      if (response.statusCode == 200) {
        return DeliveryInfoModel.fromMap(response.data['data']);
      } else {
        return response.data["message"];
      }

    } catch (e) {
      return e.toString();
    }
  }
}