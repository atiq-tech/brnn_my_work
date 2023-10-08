import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:ecommerceshope/model/my_order_model/my_order_model.dart';
import 'package:ecommerceshope/model/wishlist_model/wishlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListApi{

  static fetchWishList(context) async {

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString('token');
    print('dsddddddddddddddddd ${sharedPreferences.getString('token')}');

    try {
      const api = 'https://bornonbd.com/api/wishlist-show';
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
      print("wishdjksafhljasdfdjhlksdjkf ${response.data}");

      if (response.statusCode == 200) {
        return List<dynamic>.from(response.data["data"]["wishlist"]).map((e) => WishListModel.fromMap(e)).toList();
      } else {
        return List<dynamic>.from(response.data["data"]["wishlist"]).map((e) => WishListModel.fromMap(e)).toList();
      }

    } catch (e) {
      return e.toString();
    }
  }
}