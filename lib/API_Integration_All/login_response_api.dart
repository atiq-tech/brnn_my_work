import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_details_model.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInResponseApi{

  static fetchLoginDetails(context, phone, pass) async {

    late SharedPreferences sharedPreferences;
    LoginResponseModel? loginResponseModel;
    try {
      const api = 'https://bornonbd.com/api/login';
      final data = {
        "phone": phone.trim(),
        "password": pass.trim()
      };
      final dio = Dio();
      Response response = await dio.post(api, data: data);
      print("asfasfasfas ${response.data}");
      if (response.data['success'] == 'success') {
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', "${response.data["token"]["original"]["access_token"]}");

        loginResponseModel = LoginResponseModel.fromMap(response.data);
        print("jksdhfjkaf $loginResponseModel");
        return loginResponseModel;
      } else {
        loginResponseModel = LoginResponseModel.fromMap(response.data);
        return loginResponseModel;
      }
    } catch (e) {
      return e.toString();
    }
  }
}