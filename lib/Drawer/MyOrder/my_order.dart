import 'package:ecommerceshope/API_Integration_All/my_order_api.dart';
import 'package:ecommerceshope/Drawer/MyOrder/MyRecitReport/my_recit_report.dart';
import 'package:ecommerceshope/ProviderDemo/my_order_provider/my_order_provider.dart';
import 'package:ecommerceshope/model/LeadingModel/leading_model.dart';
import 'package:ecommerceshope/model/my_order_model/my_order_model.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class My_Order_Page extends StatefulWidget {
  My_Order_Page({Key? key}) : super(key: key);

  @override
  State<My_Order_Page> createState() => _My_Order_PageState();
}

class _My_Order_PageState extends State<My_Order_Page> {
  int xz = 0;
  double hightt = 100;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<MyOrderProvider>(context, listen: false).getMyOrder(context);
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          "My Orders",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: const LeaadingButton(),
      ),
      body: FutureBuilder(
        future: Provider.of<MyOrderProvider>(context, listen: false).getMyOrder(context),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(snapshot.hasData){
          return Container(
            padding: const EdgeInsets.all(8),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100,
                      ),
                      height: hightt,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Invoice No. ${snapshot.data?[index].invoiceNo}"),
                          Text("Date ${Utils.formatFrontEndDate(snapshot.data?[index].createdAt)}"),
                          Text("Total ${snapshot.data?[index].totalAmount}"),
                          Row(
                            children: [
                              const Text("Status: "),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                                decoration: BoxDecoration(
                                  // color: const Color(0xFf157347),
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text( "Pending",
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 20,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InvoicePage(myOrderModel: snapshot.data![index]),));
                        },
                        icon: const Icon(Icons.open_in_new_outlined),
                      ),

                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10,);
              },
              itemCount: snapshot.data!.length,
            ),
          );
        }
        else{
          return const SizedBox();
        }
      },)
    );
  }
}

class CustomtEXTsTYLE {
  final TextStyle? CustomTextStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  final TextStyle? CustomTextStyleb = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}
