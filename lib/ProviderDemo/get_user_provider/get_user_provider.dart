import 'package:ecommerceshope/API_Integration_All/get_user_profile.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:flutter/material.dart';

class UserProfileProvider with ChangeNotifier {

  Customer? customer;

  Future<Customer?>getUserData(context) async {
    customer = await UserProfileApi.fetchUserProfile(context);
    // print("asfasfasfas ${customer}");
    // notifyListeners();
    return customer;
  }
}