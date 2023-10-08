import 'package:ecommerceshope/API_All_ModelClass/me/color_model.dart';
import 'package:ecommerceshope/API_Integration_All/remove_wishlist_api.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/token_provider/token_provider.dart';
import 'package:ecommerceshope/ProviderDemo/wishlist_provider.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:ecommerceshope/model/wishlist_model/wishlist_model.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/please_signin_widget.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  int sizeValue = 0;
  int colorValue = 0;

  Map<int, ColorModel> selectedColorItemsMap = {};
  Map<int, ColorModel> selectedSizeItemsMap = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetWishListProvider.isLoading = true;
    Provider.of<GetWishListProvider>(context, listen: false).getWishList(context);
    Provider.of<TokenProvider>(context, listen: false).getToken();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProfileProvider>(context).customer;
    final token = Provider.of<TokenProvider>(context).tokenData;
    final wishList = Provider.of<GetWishListProvider>(context).wishList;

    if ("${userInfo?.message}" ==
        'Token is Expired' ||
        "${userInfo?.name}" == '' ||
        "${token}" == '' ||
        userInfo == null) {
      return const PleaseSignInWidget();
    }
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("WishList",style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold
        ),),
      ),
      body: GetWishListProvider.isLoading
          ? Center(child: CircularProgressIndicator(color: redColor,),)
          : Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: wishList.isNotEmpty
          ? ListView.separated(itemBuilder: (context, cIndex) {
            // selectedColorItemsMap[cIndex] = wishList[cIndex].product.color![0];
            // selectedSizeItemsMap[cIndex] = wishList[cIndex].product.size![0];
            // print('sdajkfasdkfs ${s}')
            return GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductCartDetails(
                              id: wishList[cIndex].productId,)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: ashColor)),
                        color: Colors.grey
                    ),
                    height: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                          child: CustomImage(
                            path: "http://bornonbd.com/uploads/products/thumbnail/${(wishList[cIndex].product.thumbImage)}" != '' ?
                            "http://bornonbd.com/uploads/products/thumbnail/${(wishList[cIndex].product.thumbImage)}" : '',
                            // path: adModel.imageUrl != '' ? adModel.imageUrl : null,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   GetWishListProvider().on();
                                // });
                                // GetWishListProvider.isLoading == true;
                                Future<String> result = RemoveWishList.fetchRemoveWishlist(wishList[cIndex].productId).then((value){
                                  if(value == 'Successfully deleted wishlist'){
                                    // Navigator.pop(context);
                                    Provider.of<GetWishListProvider>(context, listen: false).getWishList(context);
                                    Utils.showSnackBar(context, value);
                                  }else{
                                    print('${value}');
                                    Utils.errorSnackBar(context, value);
                                  }
                                  // setState(() {
                                  //   isPostReviewBtn = false;
                                  // });
                                  return value;
                                });
                                // RemoveWishList.fetchRemoveWishlist(wishList[cIndex].productId);
                              },
                              child: Icon(Icons.delete,color: Colors.red.shade800,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                wishList[cIndex].product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.w600,
                                  color: paragraphColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Price: ৳${wishList[cIndex].product.price}",
                                textAlign: TextAlign.end,
                                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        ///color
                        SizedBox(
                          height: 25,
                          child: Row(
                            children: [
                              const Text(
                                "Color: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                    scrollDirection:
                                    Axis.horizontal,
                                    itemBuilder:
                                        (context, index) {
                                      var code = wishList[cIndex].product
                                          .color?[index].code
                                          .replaceAll('#', '');
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            print('sdakfjhaskdjfhk ${selectedColorItemsMap[cIndex]}');

                                            selectedColorItemsMap[cIndex] = wishList[cIndex].product.color![index];
                                            colorValue = selectedColorItemsMap[cIndex]!.id;
                                            print('sfadfasdfdf ${colorValue}');
                                            print('sdakfjhaskdjfhk ${selectedColorItemsMap[cIndex]}');
                                          });
                                        },
                                        child: Container(
                                          width: selectedColorItemsMap[cIndex] ==
                                              wishList[cIndex].product.color![index]
                                              ? 40
                                              : 30,
                                          margin:
                                          const EdgeInsets
                                              .all(3),
                                          decoration:
                                          BoxDecoration(
                                              color: Color(
                                                  int.parse(
                                                      '0xff$code')),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  100),
                                              border: Border
                                                  .all(
                                                color: selectedColorItemsMap[cIndex] ==
                                                    wishList[cIndex].product.color![index]
                                                    ? Colors
                                                    .black
                                                    : Colors
                                                    .red,
                                                style: BorderStyle
                                                    .solid,
                                                width: selectedColorItemsMap[cIndex] ==
                                                    wishList[cIndex].product.color![index]
                                                    ? 2
                                                    : 1,
                                              ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (context, index) {
                                      return const SizedBox(
                                        width: 5,
                                      );
                                    },
                                    itemCount: wishList[cIndex].product
                                        .color!.length),
                              )
                            ],
                          ),
                        ),
                        /// Size //
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: SizedBox(
                                height: 35,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    const Text(
                                      "Size :",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection:
                                        Axis.horizontal,
                                        itemCount: wishList[cIndex]
                                            .product.size!.length,
                                        itemBuilder:
                                            (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                print('sdakfjhaskdjfhk ${selectedSizeItemsMap[cIndex]}');

                                                selectedSizeItemsMap[cIndex] = wishList[cIndex].product.size![index];
                                                sizeValue = selectedSizeItemsMap[cIndex]!.id;
                                                print('sdakfjhasksdfgsdfgdfdjfhk ${sizeValue}');
                                                print('sdakfjhaskdjfhk ${selectedSizeItemsMap[cIndex]}');
                                              });
                                            },
                                            child: Container(
                                              margin:
                                              const EdgeInsets
                                                  .only(
                                                  left: 5),
                                              alignment:
                                              Alignment.center,
                                              child: wishList[cIndex]
                                                  .product.size?[
                                              index]
                                                  .name ==
                                                  "Free Size"
                                                  ? const Text(
                                                "Free Size",
                                                style: TextStyle(
                                                    fontSize:
                                                    16,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500),
                                              )
                                                  : CircleAvatar(
                                                backgroundColor: selectedSizeItemsMap[cIndex] == wishList[cIndex].product.size![index]
                                                ? Colors
                                                    .pink
                                                    : Colors.pink[
                                                200],
                                                radius: 10,
                                                child: Text(
                                                  "${wishList[cIndex]
                                                      .product.size?[index].name}", style: const TextStyle(fontSize: 10),),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child:
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  child: const Text("CheckOut",style: TextStyle(
                                      fontSize: 14,fontWeight: FontWeight.w500
                                  ),),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CheckOutPage(
                                            product: wishList[cIndex].product,
                                            sizeId: sizeValue == 0 ? "${wishList[cIndex].product.size?[0].id}" : sizeValue.toString(),
                                            colorId: colorValue == 0 ? "${wishList[cIndex].product.color?[0].id}" : colorValue.toString(),
                                            color: wishList[cIndex].product.color,
                                            size: wishList[cIndex].product.size,
                                            qtn: 1,
                                            from: 'wishlist',
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
              separatorBuilder: (context, index) {
            return const SizedBox(height: 10,);
          }, itemCount: wishList.length,)
        :const Center(child: Text("No Data Found",style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500,
          ),),),
      ),
      // body: FutureBuilder(
      //   future: Provider.of<GetWishListProvider>(context).getWishList(context),
      //   builder: (context, snapshot) {
      //     if(snapshot.connectionState == ConnectionState.waiting){
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     else if(snapshot.hasData){
      //       return Container(
      //         padding: EdgeInsets.all(10),
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(4),
      //           border: Border.all(color: Colors.grey.shade300, width: 1),
      //         ),
      //         child: ListView.separated(itemBuilder: (context, cIndex) {
      //           return InkWell(
      //             onTap: () {
      //               // Navigator.pushNamed(context, RouteNames.adDetails,
      //               //     arguments: adModel!.slug);
      //             },
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   decoration: const BoxDecoration(
      //                       border: Border(bottom: BorderSide(color: ashColor)),
      //                       color: Colors.grey
      //                   ),
      //                   height: 150,
      //                   child: Stack(
      //                     fit: StackFit.expand,
      //                     children: [
      //                       ClipRRect(
      //                         borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      //                         child: CustomImage(
      //                           path: "http://bornonbd.com/uploads/products/thumbnail/${(snapshot.data?[cIndex].product.thumbImage)}" != '' ?
      //                           "http://bornonbd.com/uploads/products/thumbnail/${(snapshot.data?[cIndex].product.thumbImage)}" : '',
      //                           // path: adModel.imageUrl != '' ? adModel.imageUrl : null,
      //                         ),
      //                       ),
      //                       // _buildOfferInPercentage(),
      //                       // Positioned(
      //                       //   top: 8,
      //                       //   left: 8,
      //                       //   child:
      //                       //   FavoriteButton(productId: adModel!.id, isFav: adModel!.is_wishlist,from: form,),
      //                       // ),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                   padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(4),
      //                       color: Colors.white,
      //                       border: Border.all(color: Colors.grey)
      //                   ),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Expanded(
      //                             child: Text(
      //                               "${snapshot.data?[cIndex].product.name}",
      //                               maxLines: 1,
      //                               overflow: TextOverflow.ellipsis,
      //                               style: const TextStyle(
      //                                 fontSize: 16,
      //                                 height: 1.5,
      //                                 fontWeight: FontWeight.w600,
      //                                 color: paragraphColor,
      //                               ),
      //                             ),
      //                           ),
      //                           Expanded(
      //                             child: Text(
      //                               "Price: ৳${snapshot.data?[cIndex].product.price}",
      //                               textAlign: TextAlign.end,
      //                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
      //                           ),
      //                         ],
      //                       ),
      //                       const SizedBox(height: 5),
      //                       ///color
      //                       SizedBox(
      //                         height: 25,
      //                         child: Row(
      //                           children: [
      //                             Text(
      //                               "Color: ",
      //                               style: TextStyle(
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.w500,
      //                               ),
      //                             ),
      //                             Expanded(
      //                               child: ListView.separated(
      //                                   scrollDirection:
      //                                   Axis.horizontal,
      //                                   itemBuilder:
      //                                       (context, index) {
      //                                     var code = snapshot.data?[cIndex].product
      //                                         .color?[index].code
      //                                         .replaceAll('#', '');
      //                                     return GestureDetector(
      //                                       onTap: () {
      //
      //                                       },
      //                                       child: Container(
      //                                         width: 30,
      //                                         margin:
      //                                         const EdgeInsets
      //                                             .all(3),
      //                                         decoration:
      //                                         BoxDecoration(
      //                                             color: Color(
      //                                                 int.parse(
      //                                                     '0xff$code')),
      //                                             borderRadius:
      //                                             BorderRadius
      //                                                 .circular(
      //                                                 100),
      //                                             border: Border
      //                                                 .all(
      //                                               color: Colors.red,
      //                                               style: BorderStyle
      //                                                   .solid,
      //                                               width: 1,
      //                                             )),
      //                                       ),
      //                                     );
      //                                   },
      //                                   separatorBuilder:
      //                                       (context, index) {
      //                                     return const SizedBox(
      //                                       width: 5,
      //                                     );
      //                                   },
      //                                   itemCount: snapshot.data![cIndex].product
      //                                       .color!.length),
      //                             )
      //                           ],
      //                         ),
      //                       ),
      //                       /// Size //
      //                       Row(
      //                         children: [
      //                           Expanded(
      //                             flex: 5,
      //                             child: SizedBox(
      //                               height: 35,
      //                               width: double.infinity,
      //                               child: Row(
      //                                 children: [
      //                                   Text(
      //                                     "Size :",
      //                                     style: TextStyle(
      //                                         fontSize: 16,
      //                                         fontWeight:
      //                                         FontWeight.w500),
      //                                   ),
      //                                   Expanded(
      //                                     child: Container(
      //                                       // color: Colors.green,
      //                                       child: ListView.builder(
      //                                         scrollDirection:
      //                                         Axis.horizontal,
      //                                         itemCount: snapshot.data?[cIndex]
      //                                             .product.size!.length,
      //                                         itemBuilder:
      //                                             (context, index) {
      //                                           return GestureDetector(
      //                                             onTap: () {
      //                                               setState(() {
      //                                                 sizeValue = index;
      //                                               });
      //                                             },
      //                                             child: Container(
      //                                               margin:
      //                                               const EdgeInsets
      //                                                   .only(
      //                                                   left: 5),
      //                                               alignment:
      //                                               Alignment.center,
      //                                               child: snapshot.data?[cIndex]
      //                                                   .product.size?[
      //                                               index]
      //                                                   .name ==
      //                                                   "Free Size"
      //                                                   ? const Text(
      //                                                 "Free Size",
      //                                                 style: TextStyle(
      //                                                     fontSize:
      //                                                     16,
      //                                                     fontWeight:
      //                                                     FontWeight
      //                                                         .w500),
      //                                               )
      //                                                   : CircleAvatar(
      //                                                 backgroundColor: sizeValue ==
      //                                 index
      //                                 ? Colors
      //                                 .pink
      //                                 : Colors.pink[
      //                                                 200],
      //                                                 radius: 10,
      //                                                 child: Text(
      //                                                   "${snapshot.data?[cIndex]
      //                                                       .product.size?[index].name}", style: TextStyle(fontSize: 10),),
      //                                               ),
      //                                             ),
      //                                           );
      //                                         },
      //                                       ),
      //                                     ),
      //                                   )
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                           Expanded(
      //                             flex: 3,
      //                             child:
      //                             SizedBox(
      //                               height: 30,
      //                               child: ElevatedButton(
      //                                 child: Text("CheckOut",style: TextStyle(
      //                                     fontSize: 14,fontWeight: FontWeight.w500
      //                                 ),),
      //                                 onPressed: () {
      //                                 },),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                       SizedBox(height: 10)
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }, separatorBuilder: (context, index) {
      //           return SizedBox(height: 10,);
      //         }, itemCount: snapshot.data!.length)
      //       );
      //     }
      //     else{
      //       return const SizedBox();
      //     }
      //   },
      // )
    );
  }
}

