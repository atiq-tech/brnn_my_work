import 'package:ecommerceshope/API_Integration_All/for_delivery_info_api.dart';
import 'package:ecommerceshope/API_Integration_All/get_user_profile.dart';
import 'package:ecommerceshope/model/delevery_info_model.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:flutter/material.dart';

class DeliveryInfoProvider with ChangeNotifier {

  DeliveryInfoModel? deliveryInfoModel;

  Future<DeliveryInfoModel?>getDeliveryData(context) async {
    deliveryInfoModel = await DeliveryInfoApi.fetchDeliveryInfo(context);
    return deliveryInfoModel;
  }
}