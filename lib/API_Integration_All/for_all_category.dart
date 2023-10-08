//
//
//
//
// import 'dart:convert';
//  import 'package:ecommerceshope/API_All_ModelClass/all_category_model_class.dart';
// import 'package:http/http.dart' as http;
//
// final String BaseURL="https://bornonbd.com/api/";
//
//
//
// class CustomHtttpRequest {
//   static const String uri = "https://apihomechef.antapp.space";
//   static const Map<String, String> defaultHeader = {
//     "Accept": "application/json",
//     "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpaG9tZWNoZWYuYW50b3BvbGlzLnh5elwvYXBpXC9hZG1pblwvc2lnbi1pbiIsImlhdCI6MTY1NDAwNzYwNiwiZXhwIjoxNjY2OTY3NjA2LCJuYmYiOjE2NTQwMDc2MDYsImp0aSI6IjlLWGFGNmRFdlgwWVNZVzIiLCJzdWIiOjUwLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.Cbii274lgjkMIf2Ix9fZ7e8HPAT47B5MV0QP03Rd520",
//   };
//
//   static Future<dynamic> getOrder(context) async{
//     Data data;
//     List<Data> dataList = [];
//     try{
//       String link="${BaseURL}categories";
//       Uri myUri = Uri.parse(link);
//       http.Response response = await http.get(
//         myUri,
//       );
//       print(response.statusCode);
//       if(response.statusCode == 200){
//         final item = json.decode(response.body);
//         Data datainstance;
//         for(var i in item["data"]){
//           datainstance = Data.fromJson(i);
//           dataList.add(datainstance);
//           // print("orders: $dataList");
//         }
//
//       }
//       else{
//         print('Data not found');
//       }
//     } catch(e){
//       print(e);
//     }
//     return dataList;
//   }
//
//
// }

import 'package:dio/dio.dart';
 import 'package:flutter/material.dart';

import '../API_All_ModelClass/subCategorymodel_class/subcategorymodel.dart';


  // import '../API_All_ModelClass/all_category_model_class.dart';


class CustomHttprequesttt{


  static fetchUsers() async {
    try {
      Response response = await Dio().get("https://bornonbd.com/api/category-with-subcategory");
      print(response.data);
      if (response.statusCode == 200) {
        var getUsersData = response.data["data"] as List;
        var  listUsers = getUsersData.map((data) => Data.fromJson(data)).toList();
        // print(listUsers);
        return listUsers;
      } else {
        throw Exception("‘Failed to load users’");
      }
       } catch (e) {
      print(e);
    }
  }

  //
  // static fetchUsers() async {
  //   try {
  //     Response response = await Dio().get("https://bornonbd.com/api/category-with-subcategory");
  //     print(response.data);
  //     if (response.statusCode == 200) {
  //       var getUsersData = response.data["data"] as List;
  //       var  listUsers = getUsersData.map((data) => Data.fromJson(data)).toList();
  //       // print(listUsers);
  //       return listUsers;
  //     } else {
  //       throw Exception("‘Failed to load users’");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}