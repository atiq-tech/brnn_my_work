

import 'package:ecommerceshope/API_Integration_All/login_response_api.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:ecommerceshope/Screen/main/main_screen.dart';
import 'package:ecommerceshope/Screen/profile/component/my_cart.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInProvider with ChangeNotifier{

  LoginResponseModel? loginResponseModel;

  bool logInIsLoading = false;
  String token = '';

  getLogInData(context, phone, pass, isLoading,from) async {
    logInIsLoading = true;
    notifyListeners();
    loginResponseModel = await LogInResponseApi.fetchLoginDetails(context, phone, pass);
    logInIsLoading = false;
    notifyListeners();
    if(loginResponseModel?.success=='success') {
      Utils.showSnackBar(context, "${loginResponseModel?.success}");
      from ==""||from =="null"||from ==null
          ? Navigator.push(context, MaterialPageRoute(builder: (context) =>
      const MainScreen(),)):
      from =="cart"
          ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
       MyCartScreen()))
           :
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
               CheckOutPage()));
    }else if("${loginResponseModel?.error}".toString().isNotEmpty){
      print('akjshfjkasdfjkasdhfjkasdhf');
      Utils.errorSnackBar(context, "${loginResponseModel?.error}");
    }
  }
}