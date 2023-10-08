import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceshope/API_All_ModelClass/me/product_details_model.dart';
import 'package:ecommerceshope/API_Integration_All/add_to_wishlist.dart';
import 'package:ecommerceshope/API_Integration_All/post_review_api.dart';
import 'package:ecommerceshope/Custom_Add_to_cart_List/custom_add_to_cart_ist.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/ProviderDemo/token_provider/token_provider.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/HomeAddToCartProviderpage/home_add_to_cart_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/product_details_provider/product_details_provider.dart';
import 'package:ecommerceshope/ProviderDemo/review_provider/review_provider.dart';
import 'package:ecommerceshope/Screen/AllProduct/image_slider.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_card.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:ecommerceshope/auth/verify_login.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ProductCartDetails extends StatefulWidget {
  const ProductCartDetails({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int? id;
  @override
  State<ProductCartDetails> createState() => _ProductCartDetailsState();
}

class _ProductCartDetailsState extends State<ProductCartDetails> {
  final box = GetStorage();
  bool isFavorite = false;
  final _key = GlobalKey<ScaffoldState>();

  int sizeValue = 0;
  int sizeId = 0;
  int colorId = 0;
  int colorValue = 0;
  int qtn = 1;
  bool isPostReviewBtn = false;

  ProductDetailsModel? productDetailsModel;
  CarouselController carouselController = CarouselController();

  bool isNextTap = false;
  bool isPreviousTap = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TokenProvider>(context, listen: false).getToken();
  }

  bool detailsSelect = true;
  bool sellerReviewSelect = false;
  bool writeReviewSelect = false;

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final reviewCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AdddTtoCartProvider>(context, listen: true);
    final userInfo = Provider.of<UserProfileProvider>(context).customer;
    final token = Provider.of<TokenProvider>(context).tokenData;
    print('afsjdghjf ${token}');
    print('afsjdghjf ${token.runtimeType}');

    nameCtrl.text = "${userInfo?.name}";
    emailCtrl.text = "${userInfo?.email}"=="null"?"":"${userInfo?.email}";

    return Scaffold(
      key: _key,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: redColor,
        scrolledUnderElevation: 0,
        title: const Text(
          "Product Details",
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            )),
      ),
      body: FutureBuilder(
          future: Provider.of<ProductDetails>(context)
              .getProductDetails(context, widget.id),
          builder: (context, snapshot) {
            productDetailsModel = snapshot.data;
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: MultiSliver(children: [
                        SliverToBoxAdapter(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///image
                              SizedBox(
                                height: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ImageSlider(
                                        productImage: snapshot
                                            .data!.productModel.productImage,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        productModel:
                                            snapshot.data!.productModel,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///BUTTONS SECTIONS
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  // border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            detailsSelect = true;
                                            sellerReviewSelect = false;
                                            writeReviewSelect = false;
                                          });
                                        },
                                        child: Container(
                                          height: 48,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: detailsSelect
                                                ? redColor
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            // border: Border.all(color: Colors.grey.shade300),
                                          ),
                                          child: Text("Product Details",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: detailsSelect
                                                    ? Colors.white
                                                    : Colors.black,
                                              )),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            detailsSelect = false;
                                            sellerReviewSelect = true;
                                            writeReviewSelect = false;
                                          });
                                          Provider.of<UserReviewProvider>(
                                                  context,
                                                  listen: false)
                                              .getUserReview(
                                                  context, "${widget.id}");
                                        },
                                        child: Container(
                                          height: 48,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: sellerReviewSelect
                                                ? redColor
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            // border: Border.all(color: Colors.grey.shade300),
                                          ),
                                          child: Text("Product Review",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: sellerReviewSelect
                                                    ? Colors.white
                                                    : Colors.black,
                                              )),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            detailsSelect = false;
                                            sellerReviewSelect = false;
                                            writeReviewSelect = true;
                                          });
                                        },
                                        child: Container(
                                          height: 48,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: writeReviewSelect
                                                ? redColor
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            // border: Border.all(color: Colors.grey.shade300),
                                          ),
                                          child: Text(
                                            "Write Review",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: writeReviewSelect
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

                              LayoutBuilder(
                                builder: (p0, p1) {
                                  if (detailsSelect) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///name + price + add to cart
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${snapshot.data?.productModel.name}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Price: ৳${snapshot.data?.productModel.price}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200),
                                              child: IconButton(
                                                onPressed: () {
                                                  if (token == "") {
                                                    Utils.errorSnackBarWithButton(
                                                      context,
                                                      "Please LogIn First",
                                                      () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const VerifyLogin(),
                                                          )),
                                                    );
                                                    // Navigator.pushReplacement(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //       const VerifyLogin(from: "details"),
                                                    //     ));
                                                  } else {
                                                    Future<String> result =
                                                        AddWishListApi
                                                                .postToWishList(
                                                                    "${widget.id}")
                                                            .then((value) {
                                                      if (value ==
                                                          'Successfully added to wishlist') {
                                                        // Navigator.pop(context);
                                                        setState(() {
                                                          isFavorite = true;
                                                        });
                                                        Utils.showSnackBar(
                                                            context, value);
                                                      } else {
                                                        Utils.errorSnackBar(
                                                            context, value);
                                                      }
                                                      return value;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                  isFavorite
                                                      ? Icons.favorite
                                                      : Icons.favorite_outline,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),

                                        ///Category
                                        Text(
                                          "Category: ${snapshot.data?.productModel.categoryModel.name}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        ///color
                                        SizedBox(
                                          height: 30,
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
                                                      var code = snapshot.data!
                                                          .color[index].code
                                                          .replaceAll('#', '');
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            colorValue = index;
                                                            colorId =
                                                                productDetailsModel!
                                                                    .color[
                                                                        index]
                                                                    .id;
                                                            print(
                                                                'aslkdhjfjkasdfhkasdjfhkjasd $colorId');
                                                          });
                                                        },
                                                        child: Container(
                                                          width: colorValue ==
                                                                  index
                                                              ? 50
                                                              : 40,
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
                                                                    color: colorValue ==
                                                                            index
                                                                        ? Colors
                                                                            .black
                                                                        : Colors
                                                                            .red,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                    width: colorValue ==
                                                                            index
                                                                        ? 2
                                                                        : 1,
                                                                  )),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return const SizedBox(
                                                        width: 5,
                                                      );
                                                    },
                                                    itemCount: snapshot
                                                        .data!.color.length),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        /// Size //
                                        SizedBox(
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
                                                child: Container(
                                                  // color: Colors.green,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: snapshot
                                                        .data!.size.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            sizeValue = index;
                                                            sizeId =
                                                                productDetailsModel!
                                                                    .size[index]
                                                                    .id;
                                                            print(
                                                                'aslkdhjfjkasdfhkasdjfhkjasd $sizeId');
                                                          });
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          alignment:
                                                              Alignment.center,
                                                          child: snapshot
                                                                      .data
                                                                      ?.size[
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
                                                                  backgroundColor: sizeValue ==
                                                                          index
                                                                      ? Colors
                                                                          .pink
                                                                      : Colors.pink[
                                                                          200],
                                                                  radius: 16,
                                                                  child: Text(
                                                                      "${snapshot.data?.size[index].name}"),
                                                                ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        ///Sort details
                                        const Text(
                                          "Stock: Available",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        ///Quantity
                                        Row(
                                          children: [
                                            const Text(
                                              "Quantity:",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (qtn > 1) {
                                                      setState(() {
                                                        qtn--;
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      '-',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "${qtn}",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      qtn++;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      '+',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),

                                        ///shortDetails
                                        const Text(
                                          "Short Details: ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Text(
                                            Bidi.stripHtmlIfNeeded(
                                                "${snapshot.data?.productModel.shortDetails}"),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        ///note
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Text(
                                            'Free Delivary at ৳9,000.00 purchase.'
                                            'Product color may slghtly, depanding '
                                            'on light source or your device\'s screen resolution',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.green.shade600),
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        ///Size guide image
                                        const CustomImage(
                                          height: 150,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          path:
                                              'http://bornonbd.com/uploads/products/sizeguide/sizeGuide-1681713734643cea46420beMeasurement%20Chart%20Blouse.jpg',
                                        ),

                                        ///similar product
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Similar Product",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // Row(
                                            //   children: [
                                            //     GestureDetector(
                                            //       onTap: () {
                                            //         carouselController
                                            //             .previousPage();
                                            //       },
                                            //       onTapDown: _onTapPreviousDown,
                                            //       onTapUp: _onTapPreviousUp,
                                            //       child: Container(
                                            //         height: 35,
                                            //         width: 35,
                                            //         decoration: BoxDecoration(
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   50),
                                            //           border: Border.all(
                                            //               color: Colors
                                            //                   .grey.shade300),
                                            //           color: isPreviousTap
                                            //               ? Colors.black
                                            //               : Colors.white,
                                            //         ),
                                            //         child: Icon(
                                            //           Icons.arrow_back,
                                            //           size: 18,
                                            //           color: isPreviousTap
                                            //               ? Colors.white
                                            //               : Colors.black,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //     const SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     GestureDetector(
                                            //       onTap: () {
                                            //         carouselController
                                            //             .nextPage();
                                            //       },
                                            //       onTapDown: _onTapNextDown,
                                            //       onTapUp: _onTapNextUp,
                                            //       child: Container(
                                            //         height: 35,
                                            //         width: 35,
                                            //         decoration: BoxDecoration(
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   50),
                                            //           border: Border.all(
                                            //               color: Colors
                                            //                   .grey.shade300),
                                            //           color: isNextTap
                                            //               ? Colors.black
                                            //               : Colors.white,
                                            //         ),
                                            //         child: Icon(
                                            //           Icons.arrow_forward,
                                            //           size: 18,
                                            //           color: isNextTap
                                            //               ? Colors.white
                                            //               : Colors.black,
                                            //         ),
                                            //       ),
                                            //     )
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),

                                        ///similar product
                                        SizedBox(
                                          // height: 220,
                                          // color: Colors.red,
                                          child: LayoutBuilder(
                                              builder: (context, constraints) {
                                            print("Length is ${snapshot.data!.similerProduct.length}");
                                            if (snapshot
                                                .data!.similerProduct.isEmpty) {
                                              return SizedBox(
                                                height: 100,
                                                width: double.infinity,
                                                child: Center(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        border: Border.all(
                                                            color: Colors
                                                                .black54)),
                                                    child: const Text(
                                                      "Product Not Found",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            else if(snapshot
                                                .data!.similerProduct.isNotEmpty){
                                              // return CarouselSlider.builder(
                                              //   itemBuilder: (context, index,
                                              //       realIndex) {
                                              //     return ListProductCard(
                                              //       productDetailsModel:
                                              //           snapshot.data!,
                                              //       index: index,
                                              //     );
                                              //   },
                                              //   itemCount: snapshot.data!
                                              //       .similerProduct.length,
                                              //   options: CarouselOptions(
                                              //     scrollDirection:
                                              //         Axis.horizontal,
                                              //     autoPlay: false,
                                              //     viewportFraction: 1.5,
                                              //     height: 300,
                                              //   ),
                                              //   carouselController:
                                              //       carouselController,
                                              // );
                                              return Container(
                                                // height: 500,
                                                child: GridView.count(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10,
                                                  childAspectRatio: (5/6),
                                                  shrinkWrap: true,
                                                  physics: const ScrollPhysics(),
                                                  children: List.generate(snapshot.data!.similerProduct.length,(index) {
                                                    return SizedBox(
                                                      // height: 220,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => ProductCartDetails(
                                                                id: snapshot.data!.similerProduct[index].id,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Card(
                                                          elevation: 8,
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
                                                                      path: "http://bornonbd.com/uploads/products/thumbnail/${snapshot.data!.similerProduct[index].thumbImage}",
                                                                      fit: BoxFit.fill,
                                                                      width: double.infinity,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                snapshot.data!.similerProduct[index].name,
                                                                maxLines: 1,
                                                                style: const TextStyle(
                                                                  fontSize: 11,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Id No: ${snapshot.data!.similerProduct[index].id}",
                                                                maxLines: 1,
                                                                style: const TextStyle(
                                                                  fontSize: 11,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Price: ৳${snapshot.data!.similerProduct[index].price}",
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
                                                                          id: snapshot.data!.similerProduct[index].id,
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
                                                  }),
                                                ),
                                              );
                                            }
                                            return const SizedBox();
                                          }),
                                        ),
                                      ],
                                    );
                                  }

                                  if (sellerReviewSelect) {
                                    return SizedBox(
                                      child:
                                      token == ""
                                          ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyLogin(from: "details"),));
                                        },
                                            child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 15),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey.shade300),
                                                      color: Colors.white,
                                                    ),
                                                    child: const Center(
                                                        child:
                                                            Text("LogIn Please",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
                                                  ),
                                          )
                                          : FutureBuilder(
                                        future: Provider.of<
                                            UserReviewProvider>(
                                            context)
                                            .getUserReview(context,
                                            "${widget.id}"),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return ListView.separated(
                                              itemBuilder:
                                                  (context,
                                                  index) {
                                                return Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(16),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      color: Colors
                                                          .white,
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey
                                                              .shade200)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 40,
                                                                width: 40,
                                                                child: Container(
                                                                  height: 40,
                                                                  width: 40,
                                                                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4, strokeAlign: BorderSide.strokeAlignOutside), boxShadow: [
                                                                    BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 16, offset: const Offset(0, 0)),
                                                                    BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 16, offset: const Offset(0, 0)),
                                                                  ]),
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(100),
                                                                    child: CustomImage(
                                                                      path: snapshot.data?[index].customer?.profilePicture == '' ? null : 'http://bornonbd.com/${snapshot.data?[index].customer?.profilePicture}',
                                                                      height: 140,
                                                                      width: 140,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(width: 10),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 150,
                                                                    child: Text(
                                                                      '${snapshot.data?[index].customerName}',
                                                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                                                      maxLines: 2,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            padding:
                                                            const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                                            decoration:
                                                            BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(16)),
                                                            alignment:
                                                            Alignment.topCenter,
                                                            child:
                                                            const Text(
                                                              'pending',
                                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height:
                                                          12),
                                                      Text(
                                                        '${snapshot.data?[index].review}',
                                                        style:
                                                        const TextStyle(
                                                          fontSize:
                                                          14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              itemCount:
                                              snapshot.data!
                                                  .length,
                                              physics:
                                              const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (BuildContext
                                              context,
                                                  int index) {
                                                return const SizedBox(
                                                  height: 10,
                                                );
                                              },
                                            );
                                          } else if (snapshot
                                              .connectionState ==
                                              ConnectionState
                                                  .waiting) {
                                            return const Center(
                                              child:
                                              CircularProgressIndicator(),
                                            );
                                          } else {
                                            return const SizedBox(
                                              child: Center(child: Text("No Review Found")),
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  }

                                  if (writeReviewSelect) {
                                    return Form(
                                      key: formKey,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          color: Colors.white,
                                        ),
                                        child: token == ""
                                            ? GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyLogin(from: "details"),));
                                          },
                                              child: const Center(
                                              child: Text("LogIn Please",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                                            )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: TextFormField(
                                                      controller: nameCtrl,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Enter Name!';
                                                        } else {
                                                          nameCtrl.text = value;
                                                        }
                                                        return null;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade600),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color: Colors
                                                                .grey.shade600),
                                                        hintText: "Enter Name",
                                                      ),
                                                      // controller: reviewController,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: TextFormField(
                                                      controller: emailCtrl,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade600),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color: Colors
                                                                .grey.shade600),
                                                        hintText: "Enter Email",
                                                      ),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Enter Email!';
                                                        } else {
                                                          emailCtrl.text =
                                                              value;
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: TextFormField(
                                                      controller: reviewCtrl,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade600),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color: Colors
                                                                .grey.shade600),
                                                        hintText:
                                                            "Write your review",
                                                      ),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Enter Review!';
                                                        } else {
                                                          reviewCtrl.text =
                                                              value;
                                                        }
                                                        return null;
                                                      },
                                                      maxLines: 5,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 45,
                                                    width: 120,
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          setState(() {
                                                            isPostReviewBtn =
                                                                true;
                                                          });
                                                          Future<String>
                                                              result =
                                                              PostReviewApi.fetchPostReview(
                                                                      "${widget.id}",
                                                                      nameCtrl
                                                                          .text,
                                                                      emailCtrl
                                                                          .text,
                                                                      reviewCtrl
                                                                          .text)
                                                                  .then(
                                                                      (value) {
                                                            if (value ==
                                                                'successfully review waiting for approve admin') {
                                                              Navigator.pop(
                                                                  context);
                                                              Utils
                                                                  .showSnackBar(
                                                                      context,
                                                                      value);
                                                            } else {
                                                              Utils
                                                                  .errorSnackBar(
                                                                      context,
                                                                      value);
                                                            }
                                                            setState(() {
                                                              isPostReviewBtn =
                                                                  false;
                                                            });
                                                            return value;
                                                          });
                                                        }
                                                      },
                                                      child: isPostReviewBtn
                                                          ? const CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : const Text(
                                                              'Submit'),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              backgroundColor:
                                                                  redColor,
                                                              foregroundColor:
                                                                  Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                              ),

                              const SizedBox(
                                height: 45,
                              ),
                            ],
                          ),
                        ),
                      ],),),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox();
            }
          }),
      bottomSheet: Visibility(
        visible: detailsSelect,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
          ),
          child: Row(children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  // if (token == '' ||
                  //     token == "null") {
                  //   // Utils.errorSnackBarWithButton(
                  //   //   context,
                  //   //   "Please LogIn First",
                  //   //   () => Navigator.push(
                  //   //       context,
                  //   //       MaterialPageRoute(
                  //   //         builder: (context) => const LoginScreen(),
                  //   //       )),
                  //   // );
                  //   Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) =>
                  //         VerifyLogin(from: "${widget.id}"),
                  //       ));
                  // } else {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => CheckOutPage(
                  //           productModel: productDetailsModel!.productModel,
                  //           sizeId: sizeId == 0
                  //               ? "${productDetailsModel?.size[0].id}"
                  //               : sizeId.toString(),
                  //           colorId: colorId == 0
                  //               ? "${productDetailsModel?.color[0].id}"
                  //               : colorId.toString(),
                  //           color: productDetailsModel!.color,
                  //           size: productDetailsModel!.size,
                  //           qtn: qtn,
                  //           from: 'details',
                  //         ),
                  //       ));
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutPage(
                          productModel: productDetailsModel?.productModel,
                          sizeId: sizeId == 0
                              ? "${productDetailsModel?.size[0].id}"
                              : sizeId.toString(),
                          colorId: colorId == 0
                              ? "${productDetailsModel?.color[0].id}"
                              : colorId.toString(),
                          color: productDetailsModel!.color,
                          size: productDetailsModel!.size,
                          qtn: qtn,
                          from: 'details',
                        ),
                      ),
                  );

                },
                child: Container(
                  height: 45,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  alignment: Alignment.center,
                  child: const Text(
                    "Check out",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    addToCart.addProduct(
                      Custom_Add_to_cart_List(
                        name: productDetailsModel?.productModel.name,
                        price: productDetailsModel?.productModel.price,
                        id: productDetailsModel?.productModel.id,
                        quantity: qtn,
                        thumbImage: productDetailsModel?.productModel.thumbImage,
                        sizeId: sizeId == 0
                            ? "${productDetailsModel?.size[0].id}"
                            : sizeId.toString(),
                        colorId: colorId == 0
                            ? "${productDetailsModel?.color[0].id}"
                            : colorId.toString(),
                        color: productDetailsModel!.color,
                        size: productDetailsModel!.size,
                      ),
                    );
                    Utils.showSnackBar(context, "Product added to Cart");
                  });
                },
                child: Container(
                  height: 45,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  alignment: Alignment.center,
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
