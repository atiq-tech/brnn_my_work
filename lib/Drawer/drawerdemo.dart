import 'package:ecommerceshope/Drawer/MyOrder/my_order.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/Screen/AllProduct/all_product.dart';
import 'package:ecommerceshope/Screen/CategoryPageDemo/category_page_demo.dart';
import 'package:ecommerceshope/Screen/profile/component/personal_info.dart';
import 'package:ecommerceshope/auth/verify_login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DrawerDemoPage extends StatelessWidget {
 DrawerDemoPage({Key? key,required this.addreess,required  this.name,required  this.phon,required  this.photo }) : super(key: key);
 String ? name,phon,photo ,addreess;
 final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 90,
            width: double.infinity,
            color: const Color(0xff162C49).withOpacity(0.85),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    margin: const EdgeInsets.only(
                      left: 12,
                      right: 13,
                    ),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("img/sh1.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ListTile(
                          title: Text(
                    box.read('name')==null ?"Your name":box.read('name'),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            box.read("phone")==null?"Enter your phone":box.read("phone"),
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          InkWell(
          onTap: (){
            Navigator.pop(context);
            },
            child: Custom_List_Tile(icon: Icons.home, icon_name: "HOME")),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen(),));
              },
              child: Custom_List_Tile(icon: Icons.category, icon_name: "CATEGORIES")),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductScreen(),));
              },
              child: Custom_List_Tile(icon: Icons.shopping_cart, icon_name: "SHOP")),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInformation(),));
              },
              child: Custom_List_Tile(icon: Icons.account_circle_outlined, icon_name: "MY ACCOUNT")),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => My_Order_Page(),));
              },
              child: Custom_List_Tile(icon: Icons.file_present, icon_name: "MY ORDERS")),
          InkWell(
              onTap: (){

              },
              child: Custom_List_Tile(icon: Icons.location_on_outlined, icon_name: "MY ADDRESS")),
          InkWell(
              onTap: (){

              },
              child: Custom_List_Tile(icon: Icons.favorite, icon_name: "MY FAVORITES")),
          InkWell(
              onTap: (){

              },
              child: Custom_List_Tile(icon: Icons.library_books, icon_name: "INTRO")),
          InkWell(
              onTap: (){

              },
              child: Custom_List_Tile(icon: Icons.radio, icon_name: "NEWS")),
          InkWell(
              onTap: () {
                box.remove('token');
                box.remove('name');
                box.remove('phone');
                box.remove('photo');
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyLogin(),));
              },
              child: Custom_List_Tile(icon: Icons.logout_outlined, icon_name: "LOG OUT")),

        ],
      ),
    );
  }
}
class TextStylee{
  TextStyle MyTextStyle=TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: const Color(0xff162C49).withOpacity(0.85),
  ) ;
}


class Custom_List_Tile extends StatelessWidget {
  Custom_List_Tile({Key? key,required this.icon,required this.icon_name}) : super(key: key);
  final IconData? icon;
  String ? icon_name;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: 20,
          top: 5,
        ),
        height: 50,
        width: double.infinity,
        child:Column(
          children: [
            const SizedBox(
              height: 10,
              child: Divider(endIndent: 5, thickness: 2),
            ),
            Row(
              children: [
                Icon(
                  icon,
                  size:25,
                  color: const Color(0xff162C49).withOpacity(0.85),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                    '${icon_name}',
                    style: TextStylee().MyTextStyle
                ),
              ],
            ),
          ],
        )
    );
  }
}
