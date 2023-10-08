import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:ecommerceshope/Custom_Add_to_cart_List/custom_add_to_cart_ist.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HorizontalListProduct extends StatefulWidget {
  const HorizontalListProduct({super.key, required this.productList});

  final ProductList productList;

  @override
  State<HorizontalListProduct> createState() => _HorizontalListProductState();
}

class _HorizontalListProductState extends State<HorizontalListProduct> {
  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AdddTtoCartProvider>(context, listen: true);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductCartDetails(
                id: widget.productList.id,
              ),
            ),
        );
      },
      child: Card(
        elevation: 8,
        child: Container(
          width: 150,
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    // border: Border(bottom: BorderSide(color: ashColor)),
                  ),
                  height: 60,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    child: CustomImage(
                      path: "http://bornonbd.com/uploads/products/thumbnail/${widget.productList.thumbImage}",
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Text(
                "${widget.productList.name}",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${widget.productList.productCode}",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Price: ৳${widget.productList.price}",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue[400]),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductCartDetails(
                          id: widget.productList.id,
                        ),
                      ),
                    );
                    // addToCart.addProduct(
                    //   Custom_Add_to_cart_List(
                    //     name: widget.productList.name,
                    //     price: widget.productList.price,
                    //     id: widget.productList.id,
                    //     quantity: widget.productList.quantity,
                    //     thumbImage: widget.productList.thumbImage,
                    //     colorId: widget.productList.colorId,
                    //     sizeId: widget.productList.sizeId,
                    //   ),
                    // );
                  });
                  // Utils.showSnackBar(context, "Product added to Cart");
                },
                child: Container(
                  height: 26,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xff5B845B),
                  ),
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
