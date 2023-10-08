import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerceshope/Custom_Add_to_cart_List/custom_add_to_cart_ist.dart';
import 'package:ecommerceshope/Drawer/drawerdemo.dart';
import 'package:ecommerceshope/Drawer/enddrawer.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/HomeAddToCartProviderpage/home_add_to_cart_provider.dart';
import 'package:ecommerceshope/ProviderDemo/Hot_Deal_All_Product_Provider/hot_deal_all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/NewArivelProvider/new_arrivel_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/ProviderDemo/featured_product_provider/featured_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/sliderImage/slider_image.dart';
import 'package:ecommerceshope/ProviderDemo/trending_product_provider/trending_product_provider.dart';
import 'package:ecommerceshope/SQFlite_Database/contact.dart';
import 'package:ecommerceshope/Screen/AllProduct/all_product.dart';
import 'package:ecommerceshope/Screen/AllProduct/product_details_screen.dart';
import 'package:ecommerceshope/Screen/home/component/horizontal_list_product.dart';
import 'package:ecommerceshope/Screen/main/component/main_controller.dart';
import 'package:ecommerceshope/model/Custom_Hot_Deal_Model_Class/custom_hot_deal_model_class.dart';
import 'package:ecommerceshope/model/SliverAppbar/silivarappbar.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/custom_image.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, this.name, this.phone, this.photo, this.address})
      : super(key: key);
  final String? name, phone, photo, address;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int activePage = 1;
  int currentIndex = 0;

  // final PageController _controller = PageController();
  // final List<Widget> _list = [
  //   Container(
  //     height: 300,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       image:
  //           DecorationImage(image: NetworkImage('http://bornonbd.com/uploads/banner/b-16801560596425259b36f42uuuuuuuuuuuuuuuuuuuuuuu.jpg'), fit: BoxFit.fill),
  //     ),
  //   ),
  //   Container(
  //     height: 300,
  //     width: double.infinity,
  //     decoration: const BoxDecoration(
  //         image: DecorationImage(
  //             image: AssetImage("img/p3.jpg"), fit: BoxFit.fill)),
  //   ),
  //   Container(
  //     height: 300,
  //     width: double.infinity,
  //     decoration: const BoxDecoration(
  //         image: DecorationImage(
  //             image: AssetImage("img/p4.jpg"), fit: BoxFit.fill)),
  //   ),
  // ];

  Contact? contact;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());

    Provider.of<Hot_Deal_All_Product_Provider>(context, listen: false).getHotDeals(context);
    Provider.of<FeaturedProduct>(context, listen: false).getFeatured(context);
    Provider.of<TrendingProduct>(context, listen: false).getTrending(context);
    Provider.of<NewArrivelProvider>(context, listen: false).getCategories(context);
    Provider.of<SliderProvider>(context, listen: false).getSlider(context);
    Provider.of<UserProfileProvider>(context, listen: false).getUserData(context);
  }

  // void _animateSlider() {
  //   Future.delayed(const Duration(seconds: 2)).then((_) {
  //     int nextPage = _controller.page!.round() + 1;
  //     if (nextPage == _list.length) {
  //       nextPage = 0;
  //     }
  //     _controller
  //         .animateToPage(nextPage,
  //             duration: const Duration(seconds: 1), curve: Curves.linear)
  //         .then((_) => _animateSlider());
  //   });
  // }

  int valueee = 0;

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // PageIndicatorContainer container = PageIndicatorContainer(
    //   indicatorSelectorColor: Colors.amber,
    //   length: _list.length,
    //   padding: const EdgeInsets.fromLTRB(10, 40, 0, 10),
    //   indicatorSpace: 10,
    //   indicatorColor: Colors.greenAccent,
    //   child: new PageView(
    //     children: _list,
    //     controller: _controller,
    //   ),
    // );

    final hotDealsProductList =
        Provider.of<Hot_Deal_All_Product_Provider>(context).hotDealProductList;
    final trendingProductList =
        Provider.of<TrendingProduct>(context).trendingProductList;
    final featuredProductList =
        Provider.of<FeaturedProduct>(context).featuredProductList;
    final newArrivalProduct =
        Provider.of<NewArrivelProvider>(context).NewArrivelProductList;
    final sliderImages = Provider.of<SliderProvider>(context, listen: false).sliderImageList;

    print('ashfdikjlahdfkjashf ${sliderImages.length}');

    // return Scaffold(
    //   key: _key,
    //   drawer: DrawerDemoPage(
    //     name: "${widget.name}",
    //     phon: "${widget.phone}",
    //     photo: "${widget.photo}",
    //     addreess: "${widget.address}",
    //   ),
    //   endDrawer: EndDrawerPageDemo(),
    //   // bottomNavigationBar: CustomNavigationBarPage(
    //   //     Home_color: const Color(0xff1c3c5b),
    //   //     Produc_tColor: Colors.white,
    //   //     Category_color: Colors.white,
    //   //     setting_Color: Colors.white),
    //   backgroundColor: Colors.white,
    //   body: SizedBox(
    //     height: double.infinity,
    //     width: double.infinity,
    //     child: CustomScrollView(
    //       scrollDirection: Axis.vertical,
    //       slivers: [
    //         SliverAppsBarPage(
    //           onPressed: () {
    //             _key.currentState!.openDrawer();
    //           },
    //           CartButton: () {
    //             _key.currentState!.openEndDrawer();
    //           },
    //         ),
    //         SliverToBoxAdapter(
    //           child: SizedBox(
    //             height: 250,
    //             width: double.infinity,
    //             child: Stack(
    //               children: <Widget>[
    //                 Container(color: Colors.grey[100], height: double.infinity),
    //                 Container(
    //                   color: Colors.white,
    //                   child: container,
    //                   margin: const EdgeInsets.only(bottom: 10),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         //Hot deal product Title//
    //         SliverToBoxAdapter(
    //           child: Container(
    //             margin: const EdgeInsets.only(
    //               left: 15,
    //               right: 15,
    //             ),
    //             height: 30,
    //             width: double.infinity,
    //             alignment: Alignment.centerLeft,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text("Hot Deal",
    //                     style: TextStyle(
    //                       backgroundColor: Colors.lightGreen[200],
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.w500,
    //                       fontStyle: FontStyle.italic,
    //                     )),
    //                 InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => const ProductScreen(),
    //                         ));
    //                   },
    //                   child: Text("See All",
    //                       style: TextStyle(
    //                           decoration: TextDecoration.underline,
    //                           backgroundColor: Colors.white38,
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w500,
    //                           fontStyle: FontStyle.italic)),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         //Hot deal product List//
    //         SliverToBoxAdapter(
    //           child: SizedBox(
    //             height: 200,
    //             width: double.infinity,
    //             child: hotDealsProductList.isNotEmpty
    //                 ? ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: hotDealsProductList.length,
    //               itemBuilder: (context, index) {
    //                 return InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => ProductCartDetails(
    //                             // name: hotDealsProductList[index].name,
    //                             // categoryId:
    //                             //     hotDealsProductList[index].categoryId,
    //                             // colorId:
    //                             //     hotDealsProductList[index].colorId,
    //                             // description: hotDealsProductList[index]
    //                             //     .description,
    //                             // price: hotDealsProductList[index].price,
    //                             // shortDetails: hotDealsProductList[index]
    //                             //     .shortDetails,
    //                             // sizeId: hotDealsProductList[index].sizeId,
    //                             // brandId:
    //                             //     hotDealsProductList[index].brandId,
    //                             // currencyAmount: hotDealsProductList[index]
    //                             //     .currencyAmount,
    //                             id: hotDealsProductList[index].id,
    //                             // productCode: hotDealsProductList[index]
    //                             //     .productCode,
    //                             // subCategoryId: hotDealsProductList[index]
    //                             //     .subCategoryId,
    //                             // mainImage:
    //                             //     hotDealsProductList[index].mainImage,
    //                             // smallImage:
    //                             //     hotDealsProductList[index].smallImage,
    //                             // thumbImage:
    //                             //     hotDealsProductList[index].thumbImage,
    //                             // quantity:
    //                             //     hotDealsProductList[index].quantity,
    //                           ),
    //                         ));
    //                   },
    //                   child: Container(
    //                     height: 250,
    //                     width: 120,
    //                     margin: const EdgeInsets.only(left: 10, top: 10),
    //                     child: Column(
    //                       children: [
    //                         Expanded(
    //                           flex: 5,
    //                           child: Container(
    //                             height: 100,
    //                             margin: const EdgeInsets.all(3),
    //                             decoration: BoxDecoration(
    //                                 image: DecorationImage(
    //                                     image: NetworkImage(
    //                                         "http://bornonbd.com/uploads/products/thumbnail/${Hot_Deal_AllProductList[index].thumbImage}"),
    //                                     fit: BoxFit.fill)),
    //                           ),
    //                         ),
    //                         Expanded(
    //                           flex: 5,
    //                           child: Container(
    //                             height: 100,
    //                             width: 150,
    //                             margin: const EdgeInsets.all(3),
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text(
    //                                   "${Hot_Deal_AllProductList[index].name}",
    //                                   style: TextStyle(
    //                                     fontSize: 12,
    //                                     fontWeight: FontWeight.w500,
    //                                   ),
    //                                 ),
    //                                 Container(
    //                                     height: 32,
    //                                     width: double.infinity,
    //                                     margin: const EdgeInsets.only(bottom: 2),
    //                                     alignment: Alignment.center,
    //                                     child: Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceBetween,
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.center,
    //                                       children: [
    //                                         Text(
    //                                           "${Hot_Deal_AllProductList[index].price}",
    //                                           style: TextStyle(
    //                                               fontSize: 13,
    //                                               color: Colors.blue[400]),
    //                                         ),
    //                                       ],
    //                                     )),
    //                                 InkWell(
    //                                   onTap: () {
    //                                     setState(() {
    //                                       adtocart.addProduct(
    //                                           Custom_Add_to_cart_List(
    //                                         name: Hot_Deal_AllProductList[index]
    //                                             .name,
    //                                         price:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .price,
    //                                         id: Hot_Deal_AllProductList[index]
    //                                             .id,
    //                                         quantity:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .quantity,
    //                                         thumbImage:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .thumbImage,
    //                                         categoryId:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .categoryId,
    //                                         colorId:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .colorId,
    //                                         description:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .description,
    //                                         shortDetails:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .shortDetails,
    //                                         sizeId:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .sizeId,
    //                                         brandId:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .brandId,
    //                                         currencyAmount:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .currencyAmount,
    //                                         productCode:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .productCode,
    //                                         subCategoryId:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .subCategoryId,
    //                                         mainImage:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .mainImage,
    //                                         smallImage:
    //                                             Hot_Deal_AllProductList[index]
    //                                                 .smallImage,
    //                                       ));
    //                                     });
    //                                     // _AddtoCartProvierr.setcount();
    //                                     //   adtocart.addProduct(Hot_Deal_AllProductList[index]);
    //                                     // setState(() {
    //                                     //   valueee = index;
    //                                     // });
    //                                   },
    //                                   child: Container(
    //                                     height: 26,
    //                                     width: double.infinity,
    //                                     alignment: Alignment.center,
    //                                     decoration: const BoxDecoration(
    //                                       color: Color(0xff5B845B),
    //                                     ),
    //                                     child: Text(
    //                                       "Add to cart",
    //                                       style: TextStyle(
    //                                         fontSize: 16,
    //                                         color: Colors.white,
    //                                         fontWeight: FontWeight.w500,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               },
    //             )
    //                 : Center(
    //               child: Container(
    //                 padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(6),
    //                     border: Border.all(color: Colors.black54)
    //                 ),
    //                 child: Text("Product Not Found",style: const TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
    //               ),
    //             ),
    //
    //           ),
    //         ),
    //
    //         const SliverToBoxAdapter(
    //           child: SizedBox(height: 10,),
    //         ),
    //
    //         //Features product //
    //         SliverToBoxAdapter(
    //           child: Container(
    //             margin: const EdgeInsets.only(
    //               left: 15,
    //               right: 15,
    //             ),
    //             height: 30,
    //             width: double.infinity,
    //             alignment: Alignment.centerLeft,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text("Feature Product",
    //                     style: TextStyle(
    //                       backgroundColor: Colors.lightGreen[200],
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.w500,
    //                       fontStyle: FontStyle.italic,
    //                     )),
    //                 InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => const ProductScreen(),
    //                         ));
    //                   },
    //                   child: Text("See All",
    //                       style: TextStyle(
    //                           decoration: TextDecoration.underline,
    //                           backgroundColor: Colors.white38,
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w500,
    //                           fontStyle: FontStyle.italic)),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         //Features product //
    //         SliverToBoxAdapter(
    //           child: SizedBox(
    //             height: 200,
    //             width: double.infinity,
    //             child: featuredProductList.isNotEmpty
    //                 ? ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: featuredProductList.length,
    //               itemBuilder: (context, index) {
    //                 return InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => ProductCartDetails(
    //                             // name: featuredProductList[index].name,
    //                             // categoryId:
    //                             // featuredProductList[index].categoryId,
    //                             // colorId:
    //                             // featuredProductList[index].colorId,
    //                             // description:
    //                             // featuredProductList[index].description,
    //                             // price: featuredProductList[index].price,
    //                             // shortDetails: featuredProductList[index]
    //                             //     .shortDetails,
    //                             // sizeId: featuredProductList[index].sizeId,
    //                             // brandId:
    //                             // featuredProductList[index].brandId,
    //                             // currencyAmount: featuredProductList[index]
    //                             //     .currencyAmount,
    //                             id: featuredProductList[index].id,
    //                             // productCode:
    //                             // featuredProductList[index].productCode,
    //                             // subCategoryId: featuredProductList[index]
    //                             //     .subCategoryId,
    //                             // mainImage:
    //                             // featuredProductList[index].mainImage,
    //                             // smallImage:
    //                             // featuredProductList[index].smallImage,
    //                             // thumbImage:
    //                             // featuredProductList[index].thumbImage,
    //                             // quantity:
    //                             // featuredProductList[index].quantity,
    //                           ),
    //                         ));
    //                   },
    //                   child: Card(
    //                     elevation: 8,
    //                     child: Container(
    //                       height: 250,
    //                       width: 120,
    //                       margin: const EdgeInsets.only(left: 10, top: 10),
    //                       child: Column(
    //                         children: [
    //                           Expanded(
    //                             flex: 5,
    //                             child: Container(
    //                               height: 100,
    //                               margin: const EdgeInsets.all(3),
    //                               decoration: BoxDecoration(
    //                                   image: DecorationImage(
    //                                       image: NetworkImage(
    //                                           "http://bornonbd.com/uploads/products/thumbnail/${featuredProductList[index].thumbImage}"),
    //                                       fit: BoxFit.fill)),
    //                             ),
    //                           ),
    //                           Expanded(
    //                             flex: 5,
    //                             child: Container(
    //                               height: 100,
    //                               width: 150,
    //                               margin: const EdgeInsets.all(3),
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 crossAxisAlignment:
    //                                 CrossAxisAlignment.start,
    //                                 children: [
    //                                   Text(
    //                                     "${featuredProductList[index].name}",
    //                                     maxLines: 1,
    //                                     style: TextStyle(
    //                                       fontSize: 11,
    //                                       fontWeight: FontWeight.w500,
    //                                     ),
    //                                   ),
    //                                   Container(
    //                                       height: 32,
    //                                       width: double.infinity,
    //                                       margin: const EdgeInsets.only(bottom: 2),
    //                                       alignment: Alignment.centerLeft,
    //                                       child: Text(
    //                                         "${featuredProductList[index].price}",
    //                                         style: TextStyle(
    //                                             fontSize: 13,
    //                                             color: Colors.blue[400]),
    //                                       )),
    //                                   InkWell(
    //                                     onTap: () {
    //                                       setState(() {
    //                                         adtocart.addProduct(
    //                                           Custom_Add_to_cart_List(
    //                                             name: featuredProductList[
    //                                             index]
    //                                                 .name,
    //                                             price: featuredProductList[
    //                                             index]
    //                                                 .price,
    //                                             id: featuredProductList[
    //                                             index]
    //                                                 .id,
    //                                             quantity:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .quantity,
    //                                             thumbImage:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .thumbImage,
    //                                             categoryId:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .categoryId,
    //                                             colorId:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .colorId,
    //                                             description:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .description,
    //                                             shortDetails:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .shortDetails,
    //                                             sizeId:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .sizeId,
    //                                             brandId:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .brandId,
    //                                             currencyAmount:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .currencyAmount,
    //                                             productCode:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .productCode,
    //                                             subCategoryId:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .subCategoryId,
    //                                             mainImage:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .mainImage,
    //                                             smallImage:
    //                                             featuredProductList[
    //                                             index]
    //                                                 .smallImage,
    //                                           ),
    //                                         );
    //                                       });
    //
    //                                       // _AddtoCartProvierr.setcount();
    //                                       // adtocart.addProduct(adtocartlist[index]);
    //                                       // setState(() {
    //                                       //   valueee = index;
    //                                       // });
    //                                     },
    //                                     child: Container(
    //                                       height: 26,
    //                                       width: double.infinity,
    //                                       alignment: Alignment.center,
    //                                       decoration: const BoxDecoration(
    //                                         color: Color(0xff5B845B),
    //                                       ),
    //                                       child: Text(
    //                                         "Add to cart",
    //                                         style: TextStyle(
    //                                           fontSize: 16,
    //                                           color: Colors.white,
    //                                           fontWeight: FontWeight.w500,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             )
    //                 : Center(
    //                   child: Container(
    //                     padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(6),
    //                         border: Border.all(color: Colors.black54)
    //                     ),
    //                     child: Text("Product Not Found",style: const TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
    //                   ),
    //                 ),
    //           ),
    //         ),
    //
    //
    //         const SliverToBoxAdapter(
    //           child: SizedBox(height: 10,),
    //         ),
    //
    //         //New Arrivel product //
    //         SliverToBoxAdapter(
    //           child: Container(
    //             margin: const EdgeInsets.only(
    //               left: 15,
    //               right: 15,
    //             ),
    //             height: 30,
    //             width: double.infinity,
    //             alignment: Alignment.centerLeft,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text("New Arrivel",
    //                     style: TextStyle(
    //                       backgroundColor: Colors.lightGreen[200],
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.w500,
    //                       fontStyle: FontStyle.italic,
    //                     )),
    //                 InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => const ProductScreen(),
    //                         ));
    //                   },
    //                   child: Text("See All",
    //                       style: TextStyle(
    //                           decoration: TextDecoration.underline,
    //                           backgroundColor: Colors.white38,
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w500,
    //                           fontStyle: FontStyle.italic)),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         //New Arrivel product //
    //         SliverToBoxAdapter(
    //           child: SizedBox(
    //             height: 200,
    //             width: double.infinity,
    //             child: New_Arrivel_Product_list.isNotEmpty
    //                 ? ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: New_Arrivel_Product_list.length,
    //               itemBuilder: (context, index) {
    //                 return InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => ProductCartDetails(
    //                             // name: New_Arrivel_Product_list[index].name,
    //                             // categoryId:
    //                             //     New_Arrivel_Product_list[index].categoryId,
    //                             // colorId:
    //                             //     New_Arrivel_Product_list[index].colorId,
    //                             // description:
    //                             //     New_Arrivel_Product_list[index].description,
    //                             // price: New_Arrivel_Product_list[index].price,
    //                             // shortDetails: New_Arrivel_Product_list[index]
    //                             //     .shortDetails,
    //                             // sizeId: New_Arrivel_Product_list[index].sizeId,
    //                             // brandId:
    //                             //     New_Arrivel_Product_list[index].brandId,
    //                             // currencyAmount: New_Arrivel_Product_list[index]
    //                             //     .currencyAmount,
    //                             id: New_Arrivel_Product_list[index].id,
    //                             // productCode:
    //                             //     New_Arrivel_Product_list[index].productCode,
    //                             // subCategoryId: New_Arrivel_Product_list[index]
    //                             //     .subCategoryId,
    //                             // mainImage:
    //                             //     New_Arrivel_Product_list[index].mainImage,
    //                             // smallImage:
    //                             //     New_Arrivel_Product_list[index].smallImage,
    //                             // thumbImage:
    //                             //     New_Arrivel_Product_list[index].thumbImage,
    //                             // quantity:
    //                             //     New_Arrivel_Product_list[index].quantity,
    //                           ),
    //                         ));
    //                   },
    //                   child: Card(
    //                     elevation: 8,
    //                     child: Container(
    //                       height: 250,
    //                       width: 120,
    //                       margin: const EdgeInsets.only(left: 10, top: 10),
    //                       child: Column(
    //                         children: [
    //                           Expanded(
    //                             flex: 5,
    //                             child: Container(
    //                               height: 100,
    //                               margin: const EdgeInsets.all(3),
    //                               decoration: BoxDecoration(
    //                                   image: DecorationImage(
    //                                       image: NetworkImage(
    //                                           "http://bornonbd.com/uploads/products/thumbnail/${New_Arrivel_Product_list[index].thumbImage}"),
    //                                       fit: BoxFit.fill)),
    //                             ),
    //                           ),
    //                           Expanded(
    //                             flex: 5,
    //                             child: Container(
    //                               height: 100,
    //                               width: 150,
    //                               margin: const EdgeInsets.all(3),
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 children: [
    //                                   Text(
    //                                     "${New_Arrivel_Product_list[index].name}",
    //                                     maxLines: 1,
    //                                     style: TextStyle(
    //                                       fontSize: 11,
    //                                       fontWeight: FontWeight.w500,
    //                                     ),
    //                                   ),
    //                                   Container(
    //                                       height: 32,
    //                                       width: double.infinity,
    //                                       margin: const EdgeInsets.only(bottom: 2),
    //                                       alignment: Alignment.centerLeft,
    //                                       child: Text(
    //                                         "${New_Arrivel_Product_list[index].price}",
    //                                         style: TextStyle(
    //                                             fontSize: 13,
    //                                             color: Colors.blue[400]),
    //                                       )),
    //                                   InkWell(
    //                                     onTap: () {
    //                                       setState(() {
    //                                         adtocart.addProduct(
    //                                           Custom_Add_to_cart_List(
    //                                             name: New_Arrivel_Product_list[
    //                                                     index]
    //                                                 .name,
    //                                             price: New_Arrivel_Product_list[
    //                                                     index]
    //                                                 .price,
    //                                             id: New_Arrivel_Product_list[
    //                                                     index]
    //                                                 .id,
    //                                             quantity:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .quantity,
    //                                             thumbImage:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .thumbImage,
    //                                             categoryId:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .categoryId,
    //                                             colorId:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .colorId,
    //                                             description:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .description,
    //                                             shortDetails:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .shortDetails,
    //                                             sizeId:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .sizeId,
    //                                             brandId:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .brandId,
    //                                             currencyAmount:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .currencyAmount,
    //                                             productCode:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .productCode,
    //                                             subCategoryId:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .subCategoryId,
    //                                             mainImage:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .mainImage,
    //                                             smallImage:
    //                                                 New_Arrivel_Product_list[
    //                                                         index]
    //                                                     .smallImage,
    //                                           ),
    //                                         );
    //                                       });
    //
    //                                       // _AddtoCartProvierr.setcount();
    //                                       // adtocart.addProduct(adtocartlist[index]);
    //                                       // setState(() {
    //                                       //   valueee = index;
    //                                       // });
    //                                     },
    //                                     child: Container(
    //                                       height: 26,
    //                                       width: double.infinity,
    //                                       alignment: Alignment.center,
    //                                       decoration: const BoxDecoration(
    //                                         color: Color(0xff5B845B),
    //                                       ),
    //                                       child: Text(
    //                                         "Add to cart",
    //                                         style: TextStyle(
    //                                           fontSize: 16,
    //                                           color: Colors.white,
    //                                           fontWeight: FontWeight.w500,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             )
    //                 : Center(
    //               child: Container(
    //                 padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(6),
    //                     border: Border.all(color: Colors.black54)
    //                 ),
    //                 child: Text("Product Not Found",style: const TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
    //               ),
    //             ),
    //
    //           ),
    //         ),
    //
    //
    //         const SliverToBoxAdapter(
    //           child: SizedBox(height: 10,),
    //         ),
    //
    //         //Trending product //
    //         SliverToBoxAdapter(
    //           child: Container(
    //             margin: const EdgeInsets.only(
    //               left: 15,
    //               right: 15,
    //             ),
    //             height: 30,
    //             width: double.infinity,
    //             alignment: Alignment.centerLeft,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text("Trending",
    //                     style: TextStyle(
    //                       backgroundColor: Colors.lightGreen[200],
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.w500,
    //                       fontStyle: FontStyle.italic,
    //                     )),
    //                 InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => const ProductScreen(),
    //                         ));
    //                   },
    //                   child: Text("See All",
    //                       style: TextStyle(
    //                           decoration: TextDecoration.underline,
    //                           backgroundColor: Colors.white38,
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w500,
    //                           fontStyle: FontStyle.italic)),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         //Trending product //
    //         SliverToBoxAdapter(
    //           child: SizedBox(
    //             height: 200,
    //             width: double.infinity,
    //             child: trendingProductList.isNotEmpty
    //                 ? ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: trendingProductList.length,
    //               itemBuilder: (context, index) {
    //                 return InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) => ProductCartDetails(
    //                             // name: trendingProductList[index].name,
    //                             // categoryId:
    //                             // trendingProductList[index].categoryId,
    //                             // colorId:
    //                             // trendingProductList[index].colorId,
    //                             // description:
    //                             // trendingProductList[index].description,
    //                             // price: trendingProductList[index].price,
    //                             // shortDetails: trendingProductList[index]
    //                             //     .shortDetails,
    //                             // sizeId: trendingProductList[index].sizeId,
    //                             // brandId:
    //                             // trendingProductList[index].brandId,
    //                             // currencyAmount: trendingProductList[index]
    //                             //     .currencyAmount,
    //                             id: trendingProductList[index].id,
    //                             // productCode:
    //                             // trendingProductList[index].productCode,
    //                             // subCategoryId: trendingProductList[index]
    //                             //     .subCategoryId,
    //                             // mainImage:
    //                             // trendingProductList[index].mainImage,
    //                             // smallImage:
    //                             // trendingProductList[index].smallImage,
    //                             // thumbImage:
    //                             // trendingProductList[index].thumbImage,
    //                             // quantity:
    //                             // trendingProductList[index].quantity,
    //                           ),
    //                         ));
    //                   },
    //                   child: Card(
    //                     elevation: 8,
    //                     child: Container(
    //                       height: 250,
    //                       width: 120,
    //                       margin: const EdgeInsets.only(left: 10, top: 10),
    //                       child: Column(
    //                         children: [
    //                           Expanded(
    //                             flex: 5,
    //                             child: Container(
    //                               height: 100,
    //                               margin: const EdgeInsets.all(3),
    //                               decoration: BoxDecoration(
    //                                   image: DecorationImage(
    //                                       image: NetworkImage(
    //                                           "http://bornonbd.com/uploads/products/thumbnail/${trendingProductList[index].thumbImage}"),
    //                                       fit: BoxFit.fill)),
    //                             ),
    //                           ),
    //                           Expanded(
    //                             flex: 5,
    //                             child: Container(
    //                               height: 100,
    //                               width: 150,
    //                               margin: const EdgeInsets.all(3),
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 children: [
    //                                   Text(
    //                                     "${trendingProductList[index].name}",
    //                                     maxLines: 1,
    //                                     style: TextStyle(
    //                                       fontSize: 11,
    //                                       fontWeight: FontWeight.w500,
    //                                     ),
    //                                   ),
    //                                   Container(
    //                                       height: 32,
    //                                       width: double.infinity,
    //                                       margin: const EdgeInsets.only(bottom: 2),
    //                                       alignment: Alignment.centerLeft,
    //                                       child: Text(
    //                                         "${trendingProductList[index].price}",
    //                                         style: TextStyle(
    //                                             fontSize: 13,
    //                                             color: Colors.blue[400]),
    //                                       )),
    //                                   InkWell(
    //                                     onTap: () {
    //                                       setState(() {
    //                                         adtocart.addProduct(
    //                                           Custom_Add_to_cart_List(
    //                                             name: trendingProductList[
    //                                                     index]
    //                                                 .name,
    //                                             price: trendingProductList[
    //                                                     index]
    //                                                 .price,
    //                                             id: trendingProductList[
    //                                                     index]
    //                                                 .id,
    //                                             quantity:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .quantity,
    //                                             thumbImage:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .thumbImage,
    //                                             categoryId:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .categoryId,
    //                                             colorId:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .colorId,
    //                                             description:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .description,
    //                                             shortDetails:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .shortDetails,
    //                                             sizeId:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .sizeId,
    //                                             brandId:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .brandId,
    //                                             currencyAmount:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .currencyAmount,
    //                                             productCode:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .productCode,
    //                                             subCategoryId:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .subCategoryId,
    //                                             mainImage:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .mainImage,
    //                                             smallImage:
    //                                             trendingProductList[
    //                                                         index]
    //                                                     .smallImage,
    //                                           ),
    //                                         );
    //                                       });
    //
    //                                       // _AddtoCartProvierr.setcount();
    //                                       // adtocart.addProduct(adtocartlist[index]);
    //                                       // setState(() {
    //                                       //   valueee = index;
    //                                       // });
    //                                     },
    //                                     child: Container(
    //                                       height: 26,
    //                                       width: double.infinity,
    //                                       alignment: Alignment.center,
    //                                       decoration: const BoxDecoration(
    //                                         color: Color(0xff5B845B),
    //                                       ),
    //                                       child: Text(
    //                                         "Add to cart",
    //                                         style: TextStyle(
    //                                           fontSize: 16,
    //                                           color: Colors.white,
    //                                           fontWeight: FontWeight.w500,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             )
    //                 : Center(
    //               child: Container(
    //                 padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(6),
    //                     border: Border.all(color: Colors.black54)
    //                 ),
    //                 child: Text("Product Not Found",style: const TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
    //               ),
    //             ),
    //
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );

    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder(
          future: Provider.of<SliderProvider>(context, listen: false).getSlider(context),
          builder: (context, snapshot) {
          if(snapshot.hasData){
            return CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                      // height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          CarouselSlider(
                            items: List.generate(sliderImages.length, (index) {
                              return SizedBox(
                                // height: 0,
                                width: double.infinity,
                                child: CustomImage(
                                  path: "http://bornonbd.com/uploads/banner/${sliderImages[index].image}",
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              enableInfiniteScroll: sliderImages.length > 1,
                              reverse: false,
                              autoPlay: sliderImages.length > 1,
                              // autoPlay: false,
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: LayoutBuilder(
                                builder: (context,constraints) {
                                  if (sliderImages.isEmpty) {
                                    return const SizedBox();
                                  }
                                  return DotsIndicator(
                                    dotsCount: sliderImages.length,
                                    key: UniqueKey(),
                                    decorator: DotsDecorator(
                                      activeColor: redColor,
                                      color: Colors.white,
                                      activeSize: const Size(15.0, 15.0),
                                      size: const Size(15.0, 15.0),
                                      activeShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    position: currentIndex,
                                  );
                                }
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10,),
                ),
                //Hot deal product Title//
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: hotDealsProductList.isNotEmpty,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hot Deal",
                              style: TextStyle(
                                backgroundColor: Colors.lightGreen[200],
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const ProductScreen(),
                              //     ));
                              MainController().naveListener.sink.add(1);
                            },
                            child: const Text("See All",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    backgroundColor: Colors.white38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Hot deal product List//
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: hotDealsProductList.isNotEmpty,
                    child: SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: hotDealsProductList.isNotEmpty
                          ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: hotDealsProductList.length,
                        itemBuilder: (context, index) {
                          return HorizontalListProduct(productList: hotDealsProductList[index]);
                          // return InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => ProductCartDetails(
                          //             id: hotDealsProductList[index].id,
                          //           ),
                          //         ));
                          //   },
                          //   child: Container(
                          //     height: 250,
                          //     width: 120,
                          //     margin: const EdgeInsets.all(10),
                          //     child: Column(
                          //       children: [
                          //         Expanded(
                          //           flex: 5,
                          //           child: Container(
                          //             height: 100,
                          //             margin: const EdgeInsets.all(3),
                          //             decoration: BoxDecoration(
                          //                 // image: DecorationImage(
                          //                 //     image: NetworkImage(
                          //                 //         "http://bornonbd.com/uploads/products/thumbnail/${Hot_Deal_AllProductList[index].thumbImage}"),
                          //                 //     fit: BoxFit.fill),
                          //             ),
                          //             child: CustomImage(
                          //               width: double.infinity,
                          //               fit: BoxFit.fill,
                          //               path: "http://bornonbd.com/uploads/products/thumbnail/${Hot_Deal_AllProductList[index].thumbImage}",
                          //             ),
                          //           ),
                          //         ),
                          //         Expanded(
                          //           flex: 5,
                          //           child: Container(
                          //             height: 100,
                          //             width: 150,
                          //             margin: const EdgeInsets.all(3),
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Text(
                          //                   "${Hot_Deal_AllProductList[index].name}",
                          //                   style: TextStyle(
                          //                     fontSize: 12,
                          //                     fontWeight: FontWeight.w500,
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                     height: 32,
                          //                     width: double.infinity,
                          //                     margin: const EdgeInsets.only(bottom: 2),
                          //                     alignment: Alignment.center,
                          //                     child: Row(
                          //                       mainAxisAlignment:
                          //                       MainAxisAlignment.spaceBetween,
                          //                       crossAxisAlignment:
                          //                       CrossAxisAlignment.center,
                          //                       children: [
                          //                         Text(
                          //                           "${Hot_Deal_AllProductList[index].price}",
                          //                           style: TextStyle(
                          //                               fontSize: 13,
                          //                               color: Colors.blue[400]),
                          //                         ),
                          //                       ],
                          //                     )),
                          //                 InkWell(
                          //                   onTap: () {
                          //                     setState(() {
                          //                       adtocart.addProduct(
                          //                           Custom_Add_to_cart_List(
                          //                             name: Hot_Deal_AllProductList[index]
                          //                                 .name,
                          //                             price:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .price,
                          //                             id: Hot_Deal_AllProductList[index]
                          //                                 .id,
                          //                             quantity:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .quantity,
                          //                             thumbImage:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .thumbImage,
                          //                             categoryId:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .categoryId,
                          //                             colorId:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .colorId,
                          //                             description:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .description,
                          //                             shortDetails:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .shortDetails,
                          //                             sizeId:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .sizeId,
                          //                             brandId:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .brandId,
                          //                             currencyAmount:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .currencyAmount,
                          //                             productCode:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .productCode,
                          //                             subCategoryId:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .subCategoryId,
                          //                             mainImage:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .mainImage,
                          //                             smallImage:
                          //                             Hot_Deal_AllProductList[index]
                          //                                 .smallImage,
                          //                           ));
                          //                     });
                          //                     Utils.showSnackBar(context, "Product added to Cart");
                          //                   },
                          //                   child: Container(
                          //                     height: 26,
                          //                     width: double.infinity,
                          //                     alignment: Alignment.center,
                          //                     decoration: const BoxDecoration(
                          //                       color: Color(0xff5B845B),
                          //                     ),
                          //                     child: Text(
                          //                       "Add to cart",
                          //                       style: TextStyle(
                          //                         fontSize: 16,
                          //                         color: Colors.white,
                          //                         fontWeight: FontWeight.w500,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 5,);
                        },
                      )
                          : Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.black54)
                          ),
                          child: const Text("Product Not Found",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
                        ),
                      ),

                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 10,),
                ),

                //Features product //
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: featuredProductList.isNotEmpty,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Feature Product",
                              style: TextStyle(
                                backgroundColor: Colors.lightGreen[200],
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const ProductScreen(),
                              //     ));
                              MainController().naveListener.sink.add(1);
                            },
                            child: const Text("See All",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    backgroundColor: Colors.white38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Features product //
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: featuredProductList.isNotEmpty,
                    child: SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: featuredProductList.isNotEmpty
                          ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: featuredProductList.length,
                        itemBuilder: (context, index) {
                          return HorizontalListProduct(productList: featuredProductList[index]);
                          // return InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => ProductCartDetails(
                          //             id: featuredProductList[index].id,
                          //           ),
                          //         ));
                          //   },
                          //   child: Card(
                          //     elevation: 8,
                          //     child: Container(
                          //       height: 250,
                          //       width: 120,
                          //       margin: const EdgeInsets.all(10),
                          //       child: Column(
                          //         children: [
                          //           Expanded(
                          //             flex: 5,
                          //             child: Container(
                          //               height: 100,
                          //               margin: const EdgeInsets.all(3),
                          //               decoration: BoxDecoration(
                          //                   // image: DecorationImage(
                          //                   //     image: NetworkImage(
                          //                   //         "http://bornonbd.com/uploads/products/thumbnail/${featuredProductList[index].thumbImage}"),
                          //                   //     fit: BoxFit.fill),
                          //               ),
                          //               child: CustomImage(
                          //                 width: double.infinity,
                          //                 path: "http://bornonbd.com/uploads/products/thumbnail/${featuredProductList[index].thumbImage}",
                          //                 fit: BoxFit.fill,
                          //               ),
                          //             ),
                          //           ),
                          //           Expanded(
                          //             flex: 5,
                          //             child: Container(
                          //               height: 100,
                          //               width: 150,
                          //               margin: const EdgeInsets.all(3),
                          //               child: Column(
                          //                 mainAxisAlignment: MainAxisAlignment.center,
                          //                 crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(
                          //                     "${featuredProductList[index].name}",
                          //                     maxLines: 1,
                          //                     style: TextStyle(
                          //                       fontSize: 11,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                       height: 32,
                          //                       width: double.infinity,
                          //                       margin: const EdgeInsets.only(bottom: 2),
                          //                       alignment: Alignment.centerLeft,
                          //                       child: Text(
                          //                         "${featuredProductList[index].price}",
                          //                         style: TextStyle(
                          //                             fontSize: 13,
                          //                             color: Colors.blue[400]),
                          //                       )),
                          //                   InkWell(
                          //                     onTap: () {
                          //                       setState(() {
                          //                         adtocart.addProduct(
                          //                           Custom_Add_to_cart_List(
                          //                             name: featuredProductList[
                          //                             index]
                          //                                 .name,
                          //                             price: featuredProductList[
                          //                             index]
                          //                                 .price,
                          //                             id: featuredProductList[
                          //                             index]
                          //                                 .id,
                          //                             quantity:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .quantity,
                          //                             thumbImage:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .thumbImage,
                          //                             categoryId:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .categoryId,
                          //                             colorId:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .colorId,
                          //                             description:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .description,
                          //                             shortDetails:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .shortDetails,
                          //                             sizeId:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .sizeId,
                          //                             brandId:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .brandId,
                          //                             currencyAmount:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .currencyAmount,
                          //                             productCode:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .productCode,
                          //                             subCategoryId:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .subCategoryId,
                          //                             mainImage:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .mainImage,
                          //                             smallImage:
                          //                             featuredProductList[
                          //                             index]
                          //                                 .smallImage,
                          //                           ),
                          //                         );
                          //                       });
                          //                       Utils.showSnackBar(context, "Product added to Cart");
                          //                     },
                          //                     child: Container(
                          //                       height: 26,
                          //                       width: double.infinity,
                          //                       alignment: Alignment.center,
                          //                       decoration: const BoxDecoration(
                          //                         color: Color(0xff5B845B),
                          //                       ),
                          //                       child: Text(
                          //                         "Add to cart",
                          //                         style: TextStyle(
                          //                           fontSize: 16,
                          //                           color: Colors.white,
                          //                           fontWeight: FontWeight.w500,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 5,);
                        },
                      )
                          : Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.black54)
                          ),
                          child: const Text("Product Not Found",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 10,),
                ),

                //New Arrivel product //
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: newArrivalProduct.isNotEmpty,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New Arrivel",
                              style: TextStyle(
                                backgroundColor: Colors.lightGreen[200],
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const ProductScreen(),
                              //     ));
                              MainController().naveListener.sink.add(1);
                            },
                            child: const Text("See All",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    backgroundColor: Colors.white38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //New Arrivel product //
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: newArrivalProduct.isNotEmpty,
                    child: SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: newArrivalProduct.isNotEmpty
                          ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: newArrivalProduct.length,
                        itemBuilder: (context, index) {
                          return HorizontalListProduct(
                              productList: newArrivalProduct[index],
                          );
                          // return InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => ProductCartDetails(
                          //             id: New_Arrivel_Product_list[index].id,
                          //           ),
                          //         ));
                          //   },
                          //   child: Card(
                          //     elevation: 8,
                          //     child: Container(
                          //       height: 250,
                          //       width: 120,
                          //       margin: const EdgeInsets.all(10),
                          //       child: Column(
                          //         children: [
                          //           Expanded(
                          //             flex: 5,
                          //             child: Container(
                          //               height: 100,
                          //               margin: const EdgeInsets.all(3),
                          //               decoration: BoxDecoration(
                          //                   // image: DecorationImage(
                          //                   //     image: NetworkImage(
                          //                   //         "http://bornonbd.com/uploads/products/thumbnail/${New_Arrivel_Product_list[index].thumbImage}"),
                          //                   //     fit: BoxFit.fill),
                          //               ),
                          //               child: CustomImage(
                          //                 width: double.infinity,
                          //                 fit: BoxFit.fill,
                          //                 path: "http://bornonbd.com/uploads/products/thumbnail/${New_Arrivel_Product_list[index].thumbImage}",
                          //               ),
                          //             ),
                          //           ),
                          //           Expanded(
                          //             flex: 5,
                          //             child: Container(
                          //               height: 100,
                          //               width: 150,
                          //               margin: const EdgeInsets.all(3),
                          //               child: Column(
                          //                 mainAxisAlignment: MainAxisAlignment.center,
                          //                 crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(
                          //                     "${New_Arrivel_Product_list[index].name}",
                          //                     maxLines: 1,
                          //                     style: TextStyle(
                          //                       fontSize: 11,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                       height: 32,
                          //                       width: double.infinity,
                          //                       margin: const EdgeInsets.only(bottom: 2),
                          //                       alignment: Alignment.centerLeft,
                          //                       child: Text(
                          //                         "${New_Arrivel_Product_list[index].price}",
                          //                         style: TextStyle(
                          //                             fontSize: 13,
                          //                             color: Colors.blue[400]),
                          //                       )),
                          //                   InkWell(
                          //                     onTap: () {
                          //                       setState(() {
                          //                         adtocart.addProduct(
                          //                           Custom_Add_to_cart_List(
                          //                             name: New_Arrivel_Product_list[
                          //                             index]
                          //                                 .name,
                          //                             price: New_Arrivel_Product_list[
                          //                             index]
                          //                                 .price,
                          //                             id: New_Arrivel_Product_list[
                          //                             index]
                          //                                 .id,
                          //                             quantity:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .quantity,
                          //                             thumbImage:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .thumbImage,
                          //                             categoryId:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .categoryId,
                          //                             colorId:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .colorId,
                          //                             description:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .description,
                          //                             shortDetails:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .shortDetails,
                          //                             sizeId:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .sizeId,
                          //                             brandId:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .brandId,
                          //                             currencyAmount:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .currencyAmount,
                          //                             productCode:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .productCode,
                          //                             subCategoryId:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .subCategoryId,
                          //                             mainImage:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .mainImage,
                          //                             smallImage:
                          //                             New_Arrivel_Product_list[
                          //                             index]
                          //                                 .smallImage,
                          //                           ),
                          //                         );
                          //                       });
                          //                       Utils.showSnackBar(context, "Product added to Cart");
                          //                     },
                          //                     child: Container(
                          //                       height: 26,
                          //                       width: double.infinity,
                          //                       alignment: Alignment.center,
                          //                       decoration: const BoxDecoration(
                          //                         color: Color(0xff5B845B),
                          //                       ),
                          //                       child: Text(
                          //                         "Add to cart",
                          //                         style: TextStyle(
                          //                           fontSize: 16,
                          //                           color: Colors.white,
                          //                           fontWeight: FontWeight.w500,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 5,);
                        },
                      )
                          : Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.black54)
                          ),
                          child: const Text("Product Not Found",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
                        ),
                      ),

                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 10,),
                ),

                //Trending product //
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: trendingProductList.isNotEmpty,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Trending",
                              style: TextStyle(
                                backgroundColor: Colors.lightGreen[200],
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const ProductScreen(),
                              //     ));
                              MainController().naveListener.sink.add(1);
                            },
                            child: const Text("See All",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    backgroundColor: Colors.white38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Trending product //
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: trendingProductList.isNotEmpty,
                    child: SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: trendingProductList.isNotEmpty
                          ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: trendingProductList.length,
                        itemBuilder: (context, index) {
                          return HorizontalListProduct(
                              productList: trendingProductList[index],
                          );
                          // return InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => ProductCartDetails(
                          //             id: trendingProductList[index].id,
                          //           ),
                          //         ));
                          //   },
                          //   child: Card(
                          //     elevation: 8,
                          //     child: Container(
                          //       height: 250,
                          //       width: 120,
                          //       margin: const EdgeInsets.all(10),
                          //       child: Column(
                          //         children: [
                          //           Expanded(
                          //             flex: 5,
                          //             child: Container(
                          //               height: 100,
                          //               margin: const EdgeInsets.all(3),
                          //               decoration: BoxDecoration(
                          //                   // image: DecorationImage(
                          //                   //     image: NetworkImage(
                          //                   //         "http://bornonbd.com/uploads/products/thumbnail/${trendingProductList[index].thumbImage}",
                          //                   //     ),
                          //                   //     fit: BoxFit.fill),
                          //               ),
                          //               child: CustomImage(
                          //                 width: double.infinity,
                          //                 fit: BoxFit.fill,
                          //                 path: "http://bornonbd.com/uploads/products/thumbnail/${trendingProductList[index].thumbImage}",
                          //               ),
                          //             ),
                          //           ),
                          //           Expanded(
                          //             flex: 5,
                          //             child: Container(
                          //               height: 100,
                          //               width: 150,
                          //               margin: const EdgeInsets.all(3),
                          //               child: Column(
                          //                 mainAxisAlignment: MainAxisAlignment.center,
                          //                 crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(
                          //                     "${trendingProductList[index].name}",
                          //                     maxLines: 1,
                          //                     style: TextStyle(
                          //                       fontSize: 11,
                          //                       fontWeight: FontWeight.w500,
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                       height: 32,
                          //                       width: double.infinity,
                          //                       margin: const EdgeInsets.only(bottom: 2),
                          //                       alignment: Alignment.centerLeft,
                          //                       child: Text(
                          //                         "${trendingProductList[index].price}",
                          //                         style: TextStyle(
                          //                             fontSize: 13,
                          //                             color: Colors.blue[400]),
                          //                       )),
                          //                   InkWell(
                          //                     onTap: () {
                          //                       setState(() {
                          //                         adtocart.addProduct(
                          //                           Custom_Add_to_cart_List(
                          //                             name: trendingProductList[
                          //                             index]
                          //                                 .name,
                          //                             price: trendingProductList[
                          //                             index]
                          //                                 .price,
                          //                             id: trendingProductList[
                          //                             index]
                          //                                 .id,
                          //                             quantity:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .quantity,
                          //                             thumbImage:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .thumbImage,
                          //                             categoryId:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .categoryId,
                          //                             colorId:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .colorId,
                          //                             description:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .description,
                          //                             shortDetails:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .shortDetails,
                          //                             sizeId:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .sizeId,
                          //                             brandId:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .brandId,
                          //                             currencyAmount:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .currencyAmount,
                          //                             productCode:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .productCode,
                          //                             subCategoryId:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .subCategoryId,
                          //                             mainImage:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .mainImage,
                          //                             smallImage:
                          //                             trendingProductList[
                          //                             index]
                          //                                 .smallImage,
                          //                           ),
                          //                         );
                          //                       });
                          //                       Utils.showSnackBar(context, "Product added to Cart");
                          //                     },
                          //                     child: Container(
                          //                       height: 26,
                          //                       width: double.infinity,
                          //                       alignment: Alignment.center,
                          //                       decoration: const BoxDecoration(
                          //                         color: Color(0xff5B845B),
                          //                       ),
                          //                       child: Text(
                          //                         "Add to cart",
                          //                         style: TextStyle(
                          //                           fontSize: 16,
                          //                           color: Colors.white,
                          //                           fontWeight: FontWeight.w500,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 5,);
                        },
                      )
                          : Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.black54)
                          ),
                          child: const Text("Product Not Found",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return const SizedBox();
          }
        },)
      ),
    );
  }

//   final List<Custom_Add_to_cart_List> _mylist = [];
//   int? productSelected;
//   int? isheart;
//   int isSelected = 0;
//   int isSelectedd = 0;
//   List CategoryList = [
//     "Hot Deal",
//     "Top Seller",
//     "New Arrival",
//   ];
// // Initializing a Controller fore PageView
}

