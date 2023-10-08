

import 'package:ecommerceshope/Custom_Add_to_cart_List/custom_add_to_cart_ist.dart';
import 'package:flutter/cupertino.dart';


class AdddTtoCartProvider with ChangeNotifier{

  List<Custom_Add_to_cart_List> cart = [];
  double totalCartValue = 0;
  int get total => cart.length;

  void addProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    print("product id++++++++++++ $index");
    if (index != -1) {
      updateProduct(product, product.quantity + 1);
    } else {
      cart.add(product);
      calculateTotal();
      notifyListeners();
    }
  }

  // void isAddedInCart(id){
  //   int index = cart.indexWhere((i) => i.id == product.id);
  //
  // }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, quantity) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity = quantity;
    // if (cart[index].quantity == 0) removeProduct(product);
    calculateTotal();
    notifyListeners();
  }


  void clearCart() {
    cart.forEach((f) => f.quantity = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price! * f.quantity!;
    });
  }
}






