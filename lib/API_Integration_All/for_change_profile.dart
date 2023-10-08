import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeProfileApi{

  static Future<String>fetchUserData(context, name, phone, email, address, String images) async {
    print('asdjkhfkjsad ${images}');
    Dio dio = Dio();
    const api = 'https://bornonbd.com/api/customer-update';

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    final formData = FormData.fromMap({
      "name": name.trim(),
      "phone": phone.trim(),
      "email": email.trim(),
      "address": address.trim(),
      images == 'null' ? '' : "profile_picture": images == 'null' ? '' : await MultipartFile.fromFile(images, filename: 'image.jpg'),
    });

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