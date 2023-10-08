
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerceshope/model/login_model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentSuccessApi{

  static Future<String>fetchPaymentSuccess(
      {
        required String payerReference,
        required String merchantInvoiceNumber,
        required String trxID,
        required String customerMsisdn,
        required String amount,
        required String paymentID
      }) async {

    Dio dio = Dio();
    const api = 'https://bornonbd.com/api/execute-payment';

    final formData = {
      "payerReference": int.parse(payerReference),
      "merchantInvoiceNumber": merchantInvoiceNumber.trim(),
      "trxID": trxID.trim(),
      "customerMsisdn": customerMsisdn.trim(),
      "amount": amount.trim(),
      "paymentID": paymentID.trim(),
    };

    try{
      final response = await dio.post(
        api,
        data: formData,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "*/*",
            "Content-Type": "application/x-www-form-urlencoded",
          },
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      if (response.statusCode == 200) {
        return response.data['title'];
      } else {
        return response.data['title'];
      }
    }catch(e){
      return e.toString();
    }
  }
}