import 'package:ecommerceshope/Drawer/drawerdemo.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:ecommerceshope/API_All_ModelClass/all_product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final _scrollController = ScrollController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int page = 1;
  int isheart = 0;
  int valueee = 0;
  List dataList = [];

  bool isLoading = false;

  @override
  void initState() {
    Provider.of<AllProductProvider>(context, listen: false)
        .getAllProducts(context);
    super.initState();
    _init();
  }

  void _init() {
    _scrollController.addListener(() {
      isLoading = true;
      final maxExtent = _scrollController.position.maxScrollExtent - 100;
      if (maxExtent < _scrollController.position.pixels) {
        page++;
        Provider.of<AllProductProvider>(context, listen: false)
            .getMoreProducts(context,page);
        isLoading = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    // searchAdsBloc.adList.clear();
  }

  @override
  Widget build(BuildContext context) {
    final alldatalist = Provider.of<AllProductProvider>(context).allproductlist;
    print("all product length is ${alldatalist.length}");

    return SafeArea(
        child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              MultiSliver(children: [
                SliverPadding(
                  padding: const EdgeInsets.all(0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductCartDetails(
                                      id: alldatalist[index].id,
                                    ),
                                  ));
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 9,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        // border: Border(bottom: BorderSide(color: ashColor)),
                                      ),
                                      height: 120,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                        child: CustomImage(
                                          path: alldatalist[index].thumbImage == null ? '': "http://bornonbd.com/uploads/products/thumbnail/${alldatalist[index].thumbImage}",
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${alldatalist[index].name}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${alldatalist[index].productCode}",
                                      style:
                                      const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "Price: ৳${alldatalist[index].price}",
                                      style:
                                      const TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: alldatalist.length
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 200,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 2,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: isLoading,
                    child: const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(color: redColor,),
                      ),
                    ),
                  ),
                )
              ],
              ),
            ],
          ),
    );
  }
}
