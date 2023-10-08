import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:ecommerceshope/model/my_order_model/my_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOrderApi{

  static fetchMyOrder(context) async {

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString('token');
    print('dsddddddddddddddddd ${sharedPreferences.getString('token')}');

    try {
      const api = 'https://bornonbd.com/api/order-list';
      final dio = Dio();
      Response response = await dio.get(
        api,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "*/*",
            "Authorization": "Bearer ${sharedPreferences.getString('token')}",
          },
        ),
      );
      print("My Order Data in api ${response.data}");

      if (response.statusCode == 200) {
        print("My Order Data in api ${response.data}");
        return List<dynamic>.from(response.data).map((e) => MyOrderModel.fromMap(e)).toList();
      } else {
        return List<dynamic>.from(response.data).map((e) => MyOrderModel.fromMap(e)).toList();
      }

    } catch (e) {
      print("akjlsdfhkasldflk $e");
      // return e.toString();
    }
  }
}