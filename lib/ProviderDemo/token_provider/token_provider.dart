import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider with ChangeNotifier{

  String tokenData='';

  Future<void> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    tokenData = sharedPreferences.getString('token') ?? "";
    notifyListeners();
    print('my token is: $tokenData');
  }
}