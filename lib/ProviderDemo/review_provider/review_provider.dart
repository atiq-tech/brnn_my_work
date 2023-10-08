import 'package:ecommerceshope/API_Integration_All/for_hot_deal_product_api.dart';
import 'package:ecommerceshope/API_Integration_All/slider_image_api.dart';
import 'package:ecommerceshope/API_Integration_All/user_review_list.dart';
import 'package:ecommerceshope/model/slider/slider_model.dart';
import 'package:ecommerceshope/model/user_review_model/user_review_model.dart';
import 'package:flutter/cupertino.dart';

import '../../API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';

class UserReviewProvider with ChangeNotifier{
  List<UserReviewModel> userReviewModel=[];

  Future<List<UserReviewModel>>getUserReview(context, String id) async {
    userReviewModel = await UserReviewListApi.getUserReviewData(id);
    // notifyListeners();
    return userReviewModel;
  }

}