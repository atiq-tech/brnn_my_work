
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostReviewApi{

  static Future<String>fetchPostReview(String productId, String name, String email, String review) async {

    Dio dio = Dio();
    const api = 'https://bornonbd.com/api/review-product';

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    final formData = {
      "product_id": productId.trim(),
      "customer_name": name.trim(),
      "customer_email": email.trim(),
      "review": review.trim(),
    };

    try{
      final response = await dio.post(
        api,
        data: formData,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "*/*",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization":
            "Bearer ${sharedPreferences.getString('token')}",
          },
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      if (response.statusCode == 200) {
        return response.data['title'];
      } else {
        return response.data['title'];
      }
    }catch(e){
      return e.toString();
    }
  }
}