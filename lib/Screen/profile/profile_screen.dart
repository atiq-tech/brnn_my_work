import 'package:ecommerceshope/Drawer/MyOrder/my_order.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/LoginProvider/login_provider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/token_provider/token_provider.dart';
import 'package:ecommerceshope/Screen/profile/component/change_password.dart';
import 'package:ecommerceshope/Screen/profile/component/dashboard_screen.dart';
import 'package:ecommerceshope/Screen/profile/component/my_cart.dart';
import 'package:ecommerceshope/Screen/profile/component/personal_info.dart';
import 'package:ecommerceshope/Screen/profile/component/wishlist_screen.dart';
import 'package:ecommerceshope/auth/verify_login.dart';
import 'package:ecommerceshope/utils/please_signin_widget.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TokenProvider>(context, listen: false).getToken();
  }

  @override
  Widget build(BuildContext context) {

    final token = Provider.of<TokenProvider>(context, listen: false).tokenData;
    final userInfo = Provider.of<UserProfileProvider>(context, listen: false).customer;
    print('kjahsfjkasdf+ ${userInfo?.name}');
    print('kjahsfjkasdff ${userInfo?.message}');

    if (token == '' ||
        userInfo == "null") {
      return const PleaseSignInWidget();
    }

    return SafeArea(
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // const SliverAppBar(
          //   title: Text("Overview"),
          //   pinned: true,
          // ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ListTile(
                    minLeadingWidth: 0,
                    onTap: () {
                      // Navigator.pushNamed(context, RouteNames.dashboardScreen);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoardScreen(),));
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: const Icon(
                      Icons.home_outlined,
                      size: 27,
                      color: Colors.black54,
                    ),
                    title: const Text("Dashboard", style: TextStyle(fontSize: 16)),
                  ),

                  ListTile(
                    minLeadingWidth: 0,
                    onTap: () {
                      // Navigator.pushNamed(context, RouteNames.customerAds);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCartScreen(),));
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: const Icon(
                      Icons.shopping_cart,
                      size: 27,
                      color: Colors.black54,
                    ),
                    title: const Text("My Cart", style: TextStyle(fontSize: 16)),
                  ),

                  ListTile(
                    minLeadingWidth: 0,
                    onTap: () {
                      // Navigator.pushNamed(context, RouteNames.customerAds);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => My_Order_Page(),));
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: const Icon(
                      Icons.format_list_bulleted,
                      size: 27,
                      color: Colors.black54,
                    ),
                    title: const Text("My Order", style: TextStyle(fontSize: 16)),
                  ),

                  ListTile(
                    minLeadingWidth: 0,
                    onTap: () {
                      // Navigator.pushNamed(context, RouteNames.wishListScreen);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WishListScreen(),));
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: const Icon(
                      Icons.favorite_outline,
                      size: 27,
                      color: Colors.black54,
                    ),
                    title: const Text("Wishlist", style: TextStyle(fontSize: 16)),
                  ),

                  ListTile(
                    minLeadingWidth: 0,
                    onTap: () {
                      // Navigator.pushNamed(context, RouteNames.wishListScreen);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePassEdit(),));
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: const Icon(
                      Icons.password,
                      size: 27,
                      color: Colors.black54,
                    ),
                    title: const Text("Change Password", style: TextStyle(fontSize: 16)),
                  ),

                  ListTile(
                    onTap: () {
                      // Navigator.pushNamed(context, RouteNames.profileEditScreen);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInformation(),));
                    },
                    minLeadingWidth: 0,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: const Icon(
                      Icons.settings_outlined,
                      size: 27,
                      color: Colors.black54,
                    ),
                    title: const Text("Profile", style: TextStyle(fontSize: 16)),
                  ),

                  ListTile(
                    minLeadingWidth: 0,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: const Icon(
                      Icons.exit_to_app_outlined,
                      size: 27,
                      color: Colors.black54,
                    ),
                    title: const Text("Logout", style: TextStyle(fontSize: 16)),
                    onTap: () {
                      Utils.showCustomDialog(context,child: Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text("Are you sure?",style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold
                              ),),
                            ),
                            const SizedBox(height: 20,),
                            const Text("Do you want to log out from this app?"),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 80,
                                  child: ElevatedButton(
                                    child: const Text("No"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                SizedBox(
                                  height: 40,
                                  width: 80,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red
                                    ),
                                    onPressed: () async {
                                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                      sharedPreferences.clear();
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const VerifyLogin(),), (route) => false);
                                    },
                                    child: const Text("Yes"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                      },
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 65)),
        ],
      ),
    );
  }
}


