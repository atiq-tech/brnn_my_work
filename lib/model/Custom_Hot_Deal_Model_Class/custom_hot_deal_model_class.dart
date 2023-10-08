import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:ecommerceshope/ProviderDemo/HomeAddToCartProviderpage/home_add_to_cart_provider.dart';
import 'package:ecommerceshope/ProviderDemo/Hot_Deal_All_Product_Provider/hot_deal_all_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Costom_Hot_Deal_All_Product extends StatelessWidget {
  Costom_Hot_Deal_All_Product({Key? key,required this.index }) : super(key: key);

  int index;


  @override
  Widget build(BuildContext context) {
    final add_to_cart_provider=Provider.of<HomeAdddTtoCartProvider>(context,listen: true);
    final add_to_cart_providerList=Provider.of<HomeAdddTtoCartProvider>(context,listen: true).cart;
    final Hot_Deal_AllProductList=Provider.of<Hot_Deal_All_Product_Provider>(context).hotDealProductList;
    return  Container(
      height: 250,
      width: 120,
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 100,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:NetworkImage("http://bornonbd.com/uploads/products/thumbnail/${Hot_Deal_AllProductList[index].thumbImage}"),
                      fit: BoxFit.fill)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 100,
              width: 150,
              margin: EdgeInsets.all(3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Hot_Deal_AllProductList[index].name}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                      height: 32,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 2),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${Hot_Deal_AllProductList[index].price}",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.blue[400]),
                          ),

                        ],
                      )),
                  InkWell(
                    // onTap: () {
                    //   _AddtoCartProvierr.setcount();
                    //   adtocart.addProduct(_products[index]);
                    //   print("_products[index] :  ${_products[index]}");
                    //   setState(() {
                    //     valueee = index;
                    //   });
                    // },
                    child: Container(
                      height: 26,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xff5B845B),
                      ),
                      child: Text("Add to cart",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
