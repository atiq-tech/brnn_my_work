import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordApi{

  static Future<String>fetchChangePassword(context, cPass, nPass, coPass) async {

    Dio dio = Dio();
    const api = 'https://bornonbd.com/api/password-update-customer';

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

      final formData = {
        "currentPass": cPass.trim(),
        "password": nPass.trim(),
        "password_confirmation": coPass.trim(),
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