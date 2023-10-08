import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceshope/API_All_ModelClass/Hot_deal_All_Product/hot_deal_all_product.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_model.dart';
import 'package:ecommerceshope/Screen/AllProduct/show_single_image.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    required this.productImage, required this.height, required this.productModel,
  }) : super(key: key);

  final List<ProductImage> productImage;
  final double height;
  final ProductModel productModel;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  // final double height = 144;
  final int initialPage = 0;
  int currentIndex = 0;

  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.all(16),
            height: widget.height,
            child: Stack(
              children: [
                CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: widget.height,
                    viewportFraction: 1,
                    initialPage: initialPage,
                    enableInfiniteScroll: widget.productImage.length > 1,
                    reverse: false,
                    autoPlay: widget.productImage.length > 1,
                    // autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: widget.productImage.isNotEmpty ? widget.productImage
                      .map((i) => GestureDetector(
                    onTap: (){
                      // Navigator.push(
                      //     context,
                      //     Utils.createPageRouteTop(context,ShowImage(
                      //       galleries: widget.gallery,
                      //       initialIndex: _currentIndex,
                      //     )));3
                      ///
                      Navigator.push(
                          context,
                          Utils.createPageRouteTop(context,ShowSingleImage(
                              image: "http://bornonbd.com/uploads/products/others/original/${widget.productImage[currentIndex].otherMainImage}"
                          )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        // image: DecorationImage(
                        //   image: NetworkImage(i.imageUrl),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: CustomImage(path: "http://bornonbd.com/uploads/products/others/original/${i.otherMainImage}",fit: BoxFit.cover,),
                    ),
                  ))
                      .toList() : [
                    GestureDetector(
                      onTap: widget.productModel.mainImage != '' ? (){
                        Navigator.push(
                            context,
                            Utils.createPageRouteTop(context,ShowSingleImage(
                                image: 'http://bornonbd.com/uploads/products/thumbnail/${widget.productModel.mainImage}'
                            )));
                      } : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // image: DecorationImage(
                          //   image: NetworkImage(i.imageUrl),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: CustomImage(path: widget.productModel.mainImage != '' ? 'http://bornonbd.com/uploads/products/thumbnail/${widget.productModel.mainImage}' : null,fit: BoxFit.cover,),
                      ),
                    ),
                  ] ,
                ),
                // Positioned(
                //   right: 4,
                //   top: 4,
                //   child: FavoriteButton(
                //     productId: widget.adDetails.id,
                //     isFav: widget.adDetails.wishListed,
                //   ),
                // ),
                // Positioned(
                //   left: 30,
                //   bottom: 4,
                //   child: LayoutBuilder(
                //     builder: (context,constraints) {
                //       if (widget.gallery.isEmpty) {
                //         return const SizedBox();
                //       }
                //       return DotsIndicator(
                //         dotsCount: widget.gallery.length,
                //         key: UniqueKey(),
                //         decorator: DotsDecorator(
                //           activeColor: const Color(0xff18587A),
                //           color: Colors.white,
                //           activeSize: const Size(14.0, 4.0),
                //           size: const Size(14.0, 4.0),
                //           activeShape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(5.0)),
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(5.0)),
                //         ),
                //         position: _currentIndex.toDouble(),
                //       );
                //     }
                //   ),
                // ),
                // Positioned(
                //   right: 36,
                //   bottom: 4,
                //   child: Text( widget.gallery.isEmpty ? "0/0" : "${_currentIndex+1}/${widget.gallery.length}",style: const TextStyle(color: Color(0xff18587A),fontWeight: FontWeight.w600),),
                // )

                ///
                Positioned(top: 0,bottom: 0,right: 0,child: GestureDetector(onTap: () {
                  carouselController.nextPage();
                },
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.black87,)),),
                Positioned(top: 0,bottom: 0,left: 0,child: GestureDetector(onTap: () {
                  carouselController.previousPage();
                },child: const Icon(Icons.arrow_back_ios, color: Colors.black87)),)
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: widget.productImage.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  carouselController.jumpToPage(index);
                },
                child: Container(
                  margin:
                  EdgeInsets.only(top: 10, left: 10, right: 5),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomImage(
                      path: "http://bornonbd.com/uploads/products/others/small/${widget.productImage[index].otherSmallImage}",
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      currentIndex = index;
    });
  }
}
