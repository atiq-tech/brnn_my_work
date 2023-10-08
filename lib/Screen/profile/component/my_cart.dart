import 'package:ecommerceshope/ProviderDemo/AddToCartProvider/adtocartprovider.dart';
import 'package:ecommerceshope/ProviderDemo/addtocartProvider.dart';
import 'package:ecommerceshope/ProviderDemo/get_user_provider/get_user_provider.dart';
import 'package:ecommerceshope/ProviderDemo/token_provider/token_provider.dart';
import 'package:ecommerceshope/Screen/CheckOut/check_out.dart';
import 'package:ecommerceshope/auth/login_screen.dart';
import 'package:ecommerceshope/auth/verify_login.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TokenProvider>(context, listen: false).getToken();
  }

  @override
  Widget build(BuildContext context) {
    final addtocarprovider =
        Provider.of<AdddTtoCartProvider>(context, listen: true);
    final addToCartProviderList =
        Provider.of<AdddTtoCartProvider>(context, listen: true).cart;
    final userInfo = Provider.of<UserProfileProvider>(context, listen: true).customer;
    final token = Provider.of<TokenProvider>(context, listen: true).tokenData;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: addToCartProviderList.isEmpty
            ? const Center(
                child: Text(
                  "No items available",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Cart Items"),
                      TextButton(
                          onPressed: () {
                            // addtocarprovider.clearCart();
                            // Provider.of<AddtoCartProvider>(context,
                            //     listen: false)
                            //     .clear();

                            Utils.showCustomDialog(context,
                                child: Container(
                                  height: 200,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Are you sure?",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Do you what to remove all of the cart items?"
                                        " Once you remove all this item you can add"
                                        " again from product list.",
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            width: 80,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("No"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: 80,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                addtocarprovider.clearCart();
                                                Provider.of<AddtoCartProvider>(context,
                                                        listen: false)
                                                    .clear();
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Yes"),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                          },
                          child: const Text(
                            "Remove All",
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Consumer<AdddTtoCartProvider>(
                          builder: (context, value, child) {
                            return Stack(
                              children: [
                                Card(
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.purple,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "http://bornonbd.com/uploads/products/thumbnail/${addToCartProviderList[index].thumbImage}"),
                                          )),
                                    ),
                                    title: Text("${value.cart[index].name}"),
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
                                          Text(
                                            "${value.cart[index].quantity}",
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                          IconButton(
                                            icon:
                                                const Icon(Icons.remove_circle),
                                            onPressed: () {
                                              print('asdfhkasjd ${value.cart[index].quantity}');
                                              if(value.cart[index].quantity!>0){
                                                value.updateProduct(
                                                    value.cart[index],
                                                    value.cart[index].quantity! -
                                                        1);
                                              }
                                              // model.removeProduct(model.cart[index]);
                                            },
                                          ),
                                        ]),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      value.removeProduct(value.cart[index]);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: addToCartProviderList.length,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total: ৳${Provider.of<AdddTtoCartProvider>(context,
                                listen: true)
                                .totalCartValue}",
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        child: const Text("CheckOut"),
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
                          /*if(token == ""||userInfo == null){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const VerifyLogin(from: "cart"),
                                ));
                            // Utils.errorSnackBar(context, "Please login first");
                          }else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CheckOutPage(
                                        addToCart: addToCartProviderList,
                                        from: 'cart',
                                      ),
                                ));
                          }*/
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CheckOutPage(
                                      addToCart: addToCartProviderList,
                                      from: 'cart',
                                    ),
                              ));
                        },
                      ),
                  ),
                ],
              ),
      ),
    );
  }
}
