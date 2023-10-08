import 'dart:io';

import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/wishlist_provider.dart';
import 'package:ecommerceshope/Screen/AllProduct/all_product.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/category_page_demo.dart';
import 'package:ecommerceshope/Screen/home/home_screen.dart';
import 'package:ecommerceshope/Screen/main/component/bottom_navbar.dart';
import 'package:ecommerceshope/Screen/main/component/main_controller.dart';
import 'package:ecommerceshope/Screen/profile/component/my_cart.dart';
import 'package:ecommerceshope/Screen/profile/component/wishlist_screen.dart';
import 'package:ecommerceshope/Screen/profile/profile_screen.dart';
import 'package:ecommerceshope/Screen/search/search_screen.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _homeController = MainController();
  late List<Widget> pageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetWishListProvider>(context, listen: false).getWishList(context);
    pageList = [
      const HomeScreen(),
      const ProductScreen(),
      const CategoryScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {

    final addToCartProviderList = Provider.of<AdddTtoCartProvider>(context, listen: true).cart;
    final wishList = Provider.of<GetWishListProvider>(context).wishList;

    return StreamBuilder<int>(
      initialData: 0,
      stream: _homeController.naveListener.stream,
      builder: (context, snapshot) {
        int index = snapshot.data ?? 0;
        return Scaffold(
          extendBody: true,
          key: UniqueKey(),
          appBar: AppBar(
            title: Text(index != 3 ? "Bornon" : "Overview",style: const TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,
            ),),
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              index != 3 ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  child: const Icon(Icons.search),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                  },
                ),
              ):const SizedBox(),
              index != 3
                  ?Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.favorite),
                      Positioned(
                        right: -8,
                          top: -10,
                          child: Container(
                              height: 15,
                              width: 15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blueGrey.shade800),
                              child: Text(
                                '${wishList.length}',
                                style: const TextStyle(
                                  // color: Color(0xffCC1A0C),
                                    color: Colors.white,
                                    fontSize: 10,
                                  fontWeight: FontWeight.bold
                                ),
                              )))
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const WishListScreen(),),);
                  },
                ),
              )
                  :const SizedBox(),
              index != 3
                  ? Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.shopping_cart),
                      Positioned(
                          right: -8,
                          top: -10,
                          child: Container(
                              height: 15,
                              width: 15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blueGrey.shade800),
                              child: Text(
                                '${addToCartProviderList.length}',
                                style: const TextStyle(
                                    // color: Color(0xffCC1A0C),
                                  color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                ),
                              )))
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    const MyCartScreen(),));
                  },
                ),
              )
                  :const SizedBox(),
        ],
          ),
          body: WillPopScope(
            onWillPop: () => _homeController.onBackPressed(context, index),
            child: UpgradeAlert(
              upgrader: Upgrader(
                dialogStyle: Platform.isIOS
                    ? UpgradeDialogStyle.cupertino
                    : UpgradeDialogStyle.material,
              ),
              child: IndexedStack(
                index: index,
                children: pageList,
              ),
            ),
          ),
          bottomNavigationBar: MyBottomNavigationBar(
            mainController: _homeController,
            selectedIndex: index,
          ),
        );
      },
    );
  }
}
