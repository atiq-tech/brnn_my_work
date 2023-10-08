import 'package:ecommerceshope/ProviderDemo/HomeAddToCartProviderpage/home_add_to_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final addtocarprovider =
        Provider.of<HomeAdddTtoCartProvider>(context, listen: true);
    final addtocarproviderlist =
        Provider.of<HomeAdddTtoCartProvider>(context, listen: true).cart;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
                addtocarprovider.clearCart();
            },
            child: Text(
              "Clear all",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Icon(Icons.delete),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: addtocarproviderlist.length,
                itemBuilder: (context, index) {
                  return Consumer<HomeAdddTtoCartProvider>(
                    builder: (context, value, child) {
                      return Card(
                        color: Colors.cyan[100],
                        elevation: 9,
                        child: ListTile(
                          leading: Container(
                            height: 70,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${value.cart[index].imgUrl}")),
                            ),
                          ),
                          title: Text("${value!.cart[index].title}"),
                          subtitle: Text("${value.cart[index].price}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add_circle),
                                onPressed: () {
                                  value.updateProduct(value.cart[index],
                                      value.cart[index].qty! + 1);
                                  // model.removeProduct(model.cart[index]);
                                },
                              ),
                              Text("${value.cart[index].qty}"),
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () {
                                  value.updateProduct(value.cart[index],
                                      value.cart[index].qty! - 1);
                                  // model.removeProduct(model.cart[index]);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Total: \$ " +
                    Provider.of<HomeAdddTtoCartProvider>(context, listen: true)
                        .totalCartValue.toString() + "",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.limeAccent.withOpacity(0.3)),
                ),
                child: Text(
                  "Place order",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      fontStyle: FontStyle.italic),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
