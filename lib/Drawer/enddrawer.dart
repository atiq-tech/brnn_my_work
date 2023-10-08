import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/All_product_Provider/all_product_provider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/SQFlite_Database/contact.dart';
import 'package:ecommerceshope/SQFlite_Database/dbconnectpage.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EndDrawerPageDemo extends StatefulWidget {
  EndDrawerPageDemo({
    Key? key,
  }) : super(key: key);

  @override
  State<EndDrawerPageDemo> createState() => _EndDrawerPageDemoState();
}

class _EndDrawerPageDemoState extends State<EndDrawerPageDemo> {
  List productlistimg = [
    "img/s1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final addtocarprovider =
        Provider.of<AdddTtoCartProvider>(context, listen: true);
    final addtocarproviderlist =
        Provider.of<AdddTtoCartProvider>(context, listen: true).cart;

    // TODO: implement build
    return Drawer(
        child: addtocarproviderlist.isEmpty
            ? const Center(
                child: Text("No items in Cart please add"),
              )
            : SafeArea(
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 50,
                        width: double.infinity,
                        //    color: Colors.orange[200],
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  addtocarprovider.clearCart();
                                  Provider.of<AddtoCartProvider>(context,
                                          listen: false)
                                      .clear();
                                },
                                child: const Text("Delete cart")),
                            const Icon(Icons.opacity)
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: addtocarproviderlist.length,
                          itemBuilder: (context, index) {
                            return Consumer<AdddTtoCartProvider>(
                              builder: (context, value, child) {
                                return Card(
                                  color: const Color.fromARGB(
                                      -100, -200, 100, 500),
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.purple,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "http://bornonbd.com/uploads/products/thumbnail/${addtocarproviderlist[index].thumbImage}"),
                                          )),
                                    ),
                                    title: Text("${value!.cart[index].name}"),
                                    subtitle:
                                        Text("${value.cart[index].price}"),
                                    trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.add_circle),
                                            onPressed: () {
                                              value.updateProduct(
                                                  value.cart[index],
                                                  value.cart[index].quantity! +
                                                      1);
                                              // model.removeProduct(model.cart[index]);
                                            },
                                          ),
                                          Text("${value.cart[index].quantity}"),
                                          IconButton(
                                            icon:
                                                const Icon(Icons.remove_circle),
                                            onPressed: () {
                                              value.updateProduct(
                                                  value.cart[index],
                                                  value.cart[index].quantity! -
                                                      1);
                                              // model.removeProduct(model.cart[index]);
                                            },
                                          ),
                                        ]),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Total: \$ " +
                                Provider.of<AdddTtoCartProvider>(context,
                                        listen: true)
                                    .totalCartValue
                                    .toString() +
                                "",
                            style: const TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text("Order Here"),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              //
                              //     CheckOutPage(
                              //       name: "${addtocarprovider[0].name}",
                              //       categoryId:widget.categoryId ,
                              //       colorId: widget.colorId,
                              //       description:widget.description,
                              //       price:widget.price,
                              //       shortDetails:widget.shortDetails ,
                              //       sizeId:widget.sizeId,
                              //       brandId:widget.brandId,
                              //       currencyAmount:widget.currencyAmount,
                              //       id:widget.id,
                              //       productCode:widget.productCode,
                              //       subCategoryId:widget.subCategoryId,
                              //       mainImage: widget.mainImage,
                              //       smallImage: widget.smallImage,
                              //       thumbImage: widget.thumbImage,
                              //       quantity: widget.quantity,
                              //
                              //     ),
                              //
                              // ));
                            },
                          )),
                    ],),),
              ),
    );
  }
}
