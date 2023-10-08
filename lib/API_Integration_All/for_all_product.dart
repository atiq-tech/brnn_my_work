
import 'dart:convert';

 import 'package:ecommerceshope/API_All_ModelClass/all_product_model.dart';
import 'package:http/http.dart' as http;
final String BaseURL="https://bornonbd.com/api/";
class CustomHttpRequest {

  // static const Map<String, String> defaultHeader = {
  //   "Accept": "application/json",
  //   "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpaG9tZWNoZWYuYW50b3BvbGlzLnh5elwvYXBpXC9hZG1pblwvc2lnbi1pbiIsImlhdCI6MTY1NDAwNzYwNiwiZXhwIjoxNjY2OTY3NjA2LCJuYmYiOjE2NTQwMDc2MDYsImp0aSI6IjlLWGFGNmRFdlgwWVNZVzIiLCJzdWIiOjUwLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.Cbii274lgjkMIf2Ix9fZ7e8HPAT47B5MV0QP03Rd520",
  // };

  static Future<dynamic> getAllProducts(context) async{
    AllProductData data;
    List<AllProductData> dataList = [];
    try{
      String link="https://bornonbd.com/api/product";
      Uri myUri = Uri.parse(link);
      http.Response response = await http.get(myUri);
      if(response.statusCode == 200){
        final item = json.decode(response.body);
        AllProductData datainstance;
        for(var i in item["data"]["data"]){
          datainstance = AllProductData.fromJson(i);
          dataList.add(datainstance);
         // print("orders: $dataList");
        }
      }
      else{
        print('Data not found');
      }
    } catch(e){
      print(e);
    }
    return dataList;
  }
  static Future<dynamic> getMoreProducts(context,page) async{

    List<AllProductData> dataList = [];
    try{
      String link="https://bornonbd.com/api/product?page=$page";
      Uri myUri = Uri.parse(link);
      http.Response response = await http.get(myUri);
      if(response.statusCode == 200){
        final item = json.decode(response.body);
        AllProductData datainstance;
        for(var i in item["data"]["data"]){
          datainstance = AllProductData.fromJson(i);
          dataList.add(datainstance);
        }
      }
      else{
        print('Data not found');
      }
    } catch(e){
      print(e);
    }
    return dataList;
  }
}