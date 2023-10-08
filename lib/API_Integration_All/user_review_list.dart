import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/slider/slider_model.dart';
import 'package:ecommerceshope/model/user_review_model/user_review_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserReviewListApi{
  static getUserReviewData(String id) async {

    print('akjdhfkajsdfhk $id');

    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString('token');
    print('dsddddddddddddddddd ${sharedPreferences.getString('token')}');

    try {
      Response response = await Dio().get(
        "https://bornonbd.com/api/rewiew-list/${id}",
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "*/*",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer ${sharedPreferences.getString('token')}",
          },
        ),
      );
      print("asjklfhasjkdfhksf ${response.data}");
      if (response.statusCode == 200) {
        var getHotDealsData = response.data as List;
        var listHotDeals = getHotDealsData.isEmpty ? [] : getHotDealsData.map((data) => UserReviewModel.fromMap(data)).toList();
        print(listHotDeals);
        return listHotDeals;
      } else {
        throw Exception("‘Failed to load users’");
      }
    } catch (e) {
      print(e);
    }
  }
}