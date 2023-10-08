import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerceshope/API_All_ModelClass/subCategorymodel_class/subcategorymodel.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';

import 'package:ecommerceshope/ProviderDemo/SubCategory/subcategory_provider.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SubCategoryPageDemo extends StatefulWidget {
  SubCategoryPageDemo({
    Key? key,
    required this.subCategoryindex,
    required this.categoryname,
    required this.product,

  }) : super(key: key);
  int subCategoryindex;
  String categoryname;
  List<Product> product;
  // List<CustomData> customdatalist=[];

  @override
  State<SubCategoryPageDemo> createState() => _SubCategoryPageDemoState();
}

class _SubCategoryPageDemoState extends State<SubCategoryPageDemo> {

  @override
  Widget build(BuildContext context) {
    // final alldatalist =
    //     Provider.of<Sub_Category_Provider>(context).SubCategory;
    // final categoryList = Provider
    //     .of<Sub_Category_Provider>(context)
    //     .SubCategory;

    // final all_sub_category_data_list =
    //     Provider.of<Sub_Category_Provider>(context).allproductlist;
    //
    // print("jkahskjdfhasdjk ${all_sub_category_data_list.length}");
    //
    // final All_sub_category_list = Provider.of<Sub_Category_Provider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        scrolledUnderElevation: 0,
        title: Text(
          widget.categoryname,
          style: const TextStyle(
              fontSize: 17, letterSpacing: 1, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: widget.product.isNotEmpty
            ? GridView.custom(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: widget.product.length,
            (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductCartDetails(
                          id: widget.product[index].id,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child : ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10)
                              ),
                              child: CustomImage(
                                path: "http://bornonbd.com/uploads/products/thumbnail/${widget.product[index].thumbImage}",
                                fit: BoxFit.fill,
                                height: 100,
                                width: double.infinity,
                              ),
                            )
                        ),
                        Text(
                          "${widget
                              .product[index].name}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.product[index].productCode}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Price: ৳${widget
                              .product[index].price}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
            : const Center(
          child: Text("No Product Frond",style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold
          ),),
        )
        ,
      ),
    );
  }
}
