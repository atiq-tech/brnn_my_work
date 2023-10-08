import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:ecommerceshope/model/order_store_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutApi{

  static Future<OrderStoreModel>fetchCheckoutData(context, Map<String, dynamic> formData) async {
    // print('asdjkhfkjsad ${images}');
    Dio dio = Dio();
    const api = 'https://bornonbd.com/api/chekcout-store';

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    // try{
      final response = await dio.post(
        api,
        data: formData,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${sharedPreferences.getString("token")}",
          })
      );
      print('aslkdjfalksdjf ${response}');
      var data = response.data;

      if (response.statusCode == 200) {
        return OrderStoreModel.fromMap(data);
      } else {
        return OrderStoreModel.fromMap(response.data);
      }
    // }catch(e){
    //   return {'title': e.toString()};
    // }
  }
}