
import 'package:ecommerceshope/Drawer/adtocartdrawer.dart';
import 'package:ecommerceshope/ProviderDemo/HomeAddToCartProviderpage/home_add_to_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final datalist=Provider.of<HomeAdddTtoCartProvider>(context).cart;
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Home"),
        actions: [
          IconButton(onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
          }, icon: Icon(Icons.shopping_cart),),
        ],

      ),

      body:Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.purple,
        child:  ListView.builder(
          itemExtent: 80,
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return Consumer<HomeAdddTtoCartProvider>(builder:(context, value, child) {
                  return ListTile(
                      title: Text("${_products[index].title}"),
                      subtitle: Text("\$"+_products[index].price.toString()),
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("${_products[index].imgUrl}"),fit: BoxFit.fill),
                        ),
                      ),
                      trailing: ElevatedButton(
                          child: Text("Add"),
                          onPressed: ()
                              {
                                value.addProduct(_products[index]);
                              }


                      ));
                });
          },
        ),
      )

    );
  }
  List<Product> _products = [
    Product(
        id: 1,
        title: "Apple",
        price: 20.0,
        imgUrl: "https://img.icons8.com/plasticine/2x/apple.png",
        qty: 1),
    Product(
        id: 2,
        title: "Banana",
        price: 40.0,
        imgUrl: "https://img.icons8.com/cotton/2x/banana.png",
        qty: 1),
    Product(
        id: 3,
        title: "Orange",
        price: 20.0,
        imgUrl: "https://img.icons8.com/cotton/2x/orange.png",
        qty: 1),
    Product(
        id: 4,
        title: "Melon",
        price: 40.0,
        imgUrl: "https://img.icons8.com/cotton/2x/watermelon.png",
        qty: 1),
    Product(
        id: 5,
        title: "Avocado",
        price: 25.0,
        imgUrl: "https://img.icons8.com/cotton/2x/avocado.png",
        qty: 1),
  ];

}
