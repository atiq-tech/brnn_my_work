import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_details_model.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileApi{

  static fetchUserProfile(context) async {

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString('token');
    print('dsddddddddddddddddd ${sharedPreferences.getString('token')}');

    try {
      const api = 'https://bornonbd.com/api/get_user';
      final dio = Dio();
      Response response = await dio.get(
        api,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "*/*",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer ${sharedPreferences.getString('token')}",
          },
        ),
      );
      print("asfasfasfas ${response.data}");

      if (response.statusCode == 200) {
        return Customer.fromMap(response.data);
      } else {
        return Customer.fromMap(response.data);
      }

    } catch (e) {
      return e.toString();
    }
  }
}