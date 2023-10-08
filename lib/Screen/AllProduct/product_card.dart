import 'package:ecommerceshope/API_All_ModelClass/me/product_details_model.dart';
import 'package:ecommerceshope/Custom_Add_to_cart_List/custom_add_to_cart_ist.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/product_details_provider/product_details_provider.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProductCard extends StatefulWidget {
  final ProductDetailsModel productDetailsModel;
  final int index;
  const ListProductCard({
    Key? key,
    required this.index,
    required this.productDetailsModel
  }) : super(key: key);

  @override
  State<ListProductCard> createState() => _ListProductCardState();
}

class _ListProductCardState extends State<ListProductCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      // height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(0, 0),
                blurRadius: 3),
          ],
          color: Colors.white),
      child: InkWell(
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductCartDetails(
                          id: widget.productDetailsModel.similerProduct[widget
                              .index].id,)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
        ),
        // border: Border(bottom: BorderSide(color: borderColor)),
      ),
      height: 220,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: CustomImage(
              // path: RemoteUrls.imageUrl(productModel.image),
              //   path: adModel.galleries.isNotEmpty ? adModel.galleries[0].imageUrl : null,
                path: widget.productDetailsModel.similerProduct[widget.index].mainImage != ''
                    ? 'http://bornonbd.com/uploads/products/thumbnail/${widget.productDetailsModel.similerProduct[widget.index].thumbImage}'
                    : null,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  widget.productDetailsModel.similerProduct[widget.index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 3),

              Visibility(
                visible: widget.productDetailsModel.similerProduct[widget.index].price!=null,
                child: Text(
                  "৳ ${widget.productDetailsModel.similerProduct[widget.index].price}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductCartDetails(
                            id: widget.productDetailsModel.similerProduct[widget
                                .index].id,)));
              // final adtocart = Provider.of<AdddTtoCartProvider>(context, listen: false);
              //
              // setState(() {
              //   adtocart.addProduct(
              //     Custom_Add_to_cart_List(
              //       name: widget.productDetailsModel.similerProduct[widget.index].name,
              //       price: widget.productDetailsModel.similerProduct[widget.index]
              //           .price,
              //       id: widget.productDetailsModel.similerProduct[widget.index].id,
              //       quantity: widget.productDetailsModel.similerProduct[widget.index].quantity,
              //       thumbImage: widget.productDetailsModel.similerProduct[widget.index].thumbImage,
              //       colorId: widget.productDetailsModel.similerProduct[widget.index].colorId,
              //       sizeId: widget.productDetailsModel.similerProduct[widget.index].sizeId,
              //       ),
              //   );
              // });
              // Utils.showSnackBar(context, "Product added to Cart");
            }, child: const Text("Add to Cart",style: TextStyle(fontSize: 12),maxLines: 1,overflow: TextOverflow.ellipsis,)),
          )
        ],
      ),
    );
  }
}
