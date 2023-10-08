

import 'package:ecommerceshope/Practice/filedownload.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/CategoryProvider/category_provider.dart';
import 'package:ecommerceshope/ProviderDemo/HomeAddToCartProviderpage/home_add_to_cart_provider.dart';
import 'package:ecommerceshope/ProviderDemo/Hot_Deal_All_Product_Provider/hot_deal_all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/LoginProvider/login_provider.dart';
import 'package:ecommerceshope/ProviderDemo/NewArivelProvider/new_arrivel_provider.dart';
import 'package:ecommerceshope/ProviderDemo/SubCategory/subcategory_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/ProviderDemo/delivery_info_provider/delivery_info_provider.dart';
import 'package:ecommerceshope/ProviderDemo/featured_product_provider/featured_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/my_order_provider/my_order_provider.dart';
import 'package:ecommerceshope/ProviderDemo/product_details_provider/product_details_provider.dart';
import 'package:ecommerceshope/ProviderDemo/review_provider/review_provider.dart';
import 'package:ecommerceshope/ProviderDemo/sliderImage/slider_image.dart';
import 'package:ecommerceshope/ProviderDemo/token_provider/token_provider.dart';
import 'package:ecommerceshope/ProviderDemo/trending_product_provider/trending_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/wishlist_provider.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:ecommerceshope/Screen/home/home_screen.dart';
import 'package:ecommerceshope/Screen/main/main_screen.dart';
import 'package:ecommerceshope/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
//
// void main(){
//   runApp(const MyApp());
// }

main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("cart");
  runApp(const MyApp());
}


// Future<void> main() async {
//   await Hive.initFlutter();
//   var box=await Hive.openBox("Mylist");
//   runApp(const MyApp());
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddtoCartProvider>( create: (context) => AddtoCartProvider()),
        ChangeNotifierProvider<AllProductProvider>(create: (context) => AllProductProvider(),),
        ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider(),),
        ChangeNotifierProvider<NewArrivelProvider>(create: (context) => NewArrivelProvider(),),
        ChangeNotifierProvider<Sub_Category_Provider>(create: (context) => Sub_Category_Provider(),),
        ChangeNotifierProvider<LogInProvider>(create: (context) => LogInProvider(),),
        ChangeNotifierProvider<AdddTtoCartProvider>(create: (context) => AdddTtoCartProvider(),),
        ChangeNotifierProvider<HomeAdddTtoCartProvider>(create: (context) => HomeAdddTtoCartProvider(),),
        ChangeNotifierProvider<Hot_Deal_All_Product_Provider>(create: (context) => Hot_Deal_All_Product_Provider(),),
        ChangeNotifierProvider<TrendingProduct>(create: (context) => TrendingProduct(),),
        ChangeNotifierProvider<FeaturedProduct>(create: (context) => FeaturedProduct(),),
        ChangeNotifierProvider<ProductDetails>(create: (context) => ProductDetails(),),
        ChangeNotifierProvider<SliderProvider>(create: (context) => SliderProvider(),),
        ChangeNotifierProvider<TokenProvider>(create: (context) => TokenProvider(),),
        ChangeNotifierProvider<UserProfileProvider>(create: (context) => UserProfileProvider(),),
        ChangeNotifierProvider<UserReviewProvider>(create: (context) => UserReviewProvider(),),
        ChangeNotifierProvider<MyOrderProvider>(create: (context) => MyOrderProvider(),),
        ChangeNotifierProvider<GetWishListProvider>(create: (context) => GetWishListProvider(),),
        ChangeNotifierProvider<DeliveryInfoProvider>(create: (context) => DeliveryInfoProvider(),),
        ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Ecommerce Shop',
         theme: MyTheme.theme,
         //  home: const SPlash_Screen_Page(),
         //  home: Ecommerce_Home_Page(),
         //  home: My_Order_Page(),
         //  home: RecitReportPage(),
         //  home: MyStatefulWidget(),
         home: const MainScreen(),

       ),
    );
  }
}

