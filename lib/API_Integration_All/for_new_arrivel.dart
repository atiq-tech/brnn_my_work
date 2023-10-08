


import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:http/http.dart';

class Custom_Api_NewArrivel{

  static fatchnewarrivel() async {
    try{
      var response=await Dio().get("https://bornonbd.com/api/newarrival");
      print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv${response.statusCode}");
      if(response.statusCode==200){
        var getUser=response.data["data"] as List;
        var ListUser=getUser.map((e) => ProductList.fromJson(e)).toList();
        print(ListUser);
        return ListUser;
      }
      else{
        print("responce Status codeeeeeeeeeeee reeor ${response.statusCode}");
      }
    }catch(e){
      print("Yor new marrivel caterror $e");
    }

  }

}