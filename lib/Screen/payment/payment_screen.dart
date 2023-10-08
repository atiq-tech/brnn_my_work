import 'package:ecommerceshope/API_Integration_All/for_payment_success_api.dart';
import 'package:ecommerceshope/Screen/main/main_screen.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.invoice, required this.orderId, required this.total});
  final String invoice;
  final String orderId;
  final double total;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isLoading = false;

  @override
  void initState() {
    paymentCheckout(widget.total, widget.orderId, widget.invoice);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bkash Payment"),
      ),
    );
  }

  Future<void> paymentCheckout(double amount, payerReference, invoice) async {
    // sandbox
    final flutterBkash = FlutterBkash(
      bkashCredentials: const BkashCredentials(
        username: "01766622202",
        password: "@)4I!QSfkLv",
        appKey: "L6OCZUc9BJotOg21RyHbGtUEtc",
        appSecret: "ZkxJH76ENYB4y1zaI08fCgdkfikAgqRqxwkxUsAvVbtpDe8H3ijK",
        isSandbox: false,
      ),
    );

    /// Goto BkashPayment page & pass the params
    try {
      /// call pay method to pay without agreement as parameter pass the context, amount, merchantInvoiceNumber
      final result = await flutterBkash.pay(
        context: context,
        // need the context as BuildContext
        amount: amount,
        // need it double type
        merchantInvoiceNumber: "${invoice}",
      );

      /// if the payment is success then show the log
      print("sdkjlfhlksdf ${result.toString()}");
      Utils.showSnackBar(context, "Payment Success");

      var data = PaymentSuccessApi.fetchPaymentSuccess(
          amount: "$amount",
          customerMsisdn: result.customerMsisdn,
          merchantInvoiceNumber: result.merchantInvoiceNumber,
          payerReference: "${payerReference}",
          paymentID: result.paymentId,
          trxID: result.trxId
      ).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
        print('payment ststus store scuuecc');
      });


      /// if the payment is success then show the snack-bar
    } on BkashFailure catch (e, st) {
      /// if something went wrong then show the log
      print("failll ${e.message}");
      print("file ${st}");
      if(e.message == "Payment Cancelled"||e.message == "Insufficient Balance"){
        Utils.errorSnackBar(context, e.message);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
      }
      else{
        Utils.errorSnackBar(context, e.message);
        Navigator.pop(context);
      }

      /// if something went wrong then show the snack-bar
    } catch (e, st) {
      /// if something went wrong then show the log
      print("failll+++ ${e}");
      print("file+++ ${st}");

      /// if something went wrong then show the snack-bar
      Utils.errorSnackBar(context, "Something went wrong");
    }
    setState(() {
      isLoading = false;
    });
    return;
  }

}
