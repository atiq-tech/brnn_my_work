import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:ecommerceshope/API_Integration_All/for_new_arrivel.dart';
import 'package:ecommerceshope/API_Integration_All/my_order_api.dart';
import 'package:ecommerceshope/model/my_order_model/my_order_model.dart';
import 'package:flutter/cupertino.dart';

class MyOrderProvider with ChangeNotifier{
  List<MyOrderModel> myOrderModel=[];

  Future<List<MyOrderModel>>getMyOrder(context) async {
    myOrderModel = await MyOrderApi.fetchMyOrder(context);
    print('my order data provider ${myOrderModel[0].customerName}');
    // notifyListeners();
    return myOrderModel;
  }
}