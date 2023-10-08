import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoveWishList{

  static Future<String>fetchRemoveWishlist(int productId) async {

    print('asdkhfjkashdf');
    Dio dio = Dio();
    final api = 'https://bornonbd.com/api/wishlist-delete/$productId';

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    try{
      final response = await dio.get(
        api,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Authorization":
            "Bearer ${sharedPreferences.getString('token')}",
          },
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      if (response.statusCode == 200) {
        print('${response.data['title']}');
        return response.data['title'];
      } else {
        return response.data['title'];
      }
    }catch(e){
      return e.toString();
    }
  }
}