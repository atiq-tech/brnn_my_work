import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class SliverAppsBarPage extends StatelessWidget {
  SliverAppsBarPage({Key? key,required this.onPressed,required this.CartButton}) : super(key: key);
    VoidCallback onPressed;
    VoidCallback CartButton;
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return SliverAppBar(
      backgroundColor: const Color(0xff415b75),
      pinned: true,
      flexibleSpace: Container(
        height: 50,
        width: double.infinity,
        //  color: Color(0xff415b75).withOpacity(0.4),
      ),
      floating: true,
      toolbarHeight: 50,
      leading: IconButton(
         onPressed:onPressed ,
          icon: const Icon(
            Icons.menu,
            size: 25,
          )),
      title: Text(
        "Bornon",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          wordSpacing: 2,
        ),
      ),

      actions: [
        IconButton(onPressed: () {

        }, icon: const Icon(Icons.search,size: 30,),
        ),
        Visibility(
          visible: box.read('token') == null,
          child: IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
          }, icon: const Icon(Icons.account_circle_outlined,size: 30,),
          ),
        ),

        InkWell(
          onTap: CartButton,
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart,size: 30,)),
                Positioned(
               right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 8,

              child: Consumer<AdddTtoCartProvider>(builder: (context, value, child) {
                  return Text("${value.cart.length}",style: const TextStyle(color: Colors.white,fontSize: 12,letterSpacing: 0,fontWeight: FontWeight.w400),);
              }),
            ),
          ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
