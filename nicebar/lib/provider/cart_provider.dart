import 'package:flutter/material.dart';

import '../model/product.dart';

/*this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        this.cartProduct.remove(element);  }
    });*/

// class CartProduct {
//   int count;
//   Product product;

//   CartProduct(this.count, this.product);
// }

class CartProvider with ChangeNotifier {
  List<Product> carts = [];

  void addProduct(Product product) {
    carts.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    carts.remove(product);
    notifyListeners();
  }

  void resetCart() {
    carts.clear();
    notifyListeners();
  }

  // deleteProduct(CartProduct pro) {
  //   this.cartProduct.forEach((element) {
  //     if (element.product.id == pro.product.id) {
  //       totalAmount -= element.product.price * element.count;

  //       this.cartProduct.remove(element);

  //       notifyListeners();
  //     }
  //   });

  //   //this.cartProduct
  //   // .removeWhere((element) => element.product.id == pro.product.id);

  //   notifyListeners();
  // }

  // List<CartProduct> getList() {
  //   return cartProduct;
  // }

  // add(CartProduct cartPro) {
  //   cartProduct.add(cartPro);
  //   notifyListeners();
  // }

  // has(CartProduct pro) {
  //   int states = 0;
  //   this.cartProduct.forEach((element) {
  //     if (element.product.id == pro.product.id) {
  //       states = 1;
  //     }
  //   });
  //   if (states == 1) {
  //     return true;
  //   }
  //   return false;
  // }

  // int getCount(CartProduct pro) {
  //   int count = 0;
  //   this.cartProduct.forEach((element) {
  //     if (element.product.id == pro.product.id) {
  //       count = element.count;
  //     }
  //   });
  //   return count;
  // }

  // updateProduct(CartProduct pro, int counter) {
  //   cartProduct.forEach((element) {
  //     if (element.product.id == pro.product.id) {
  //       totalAmount -= element.count * element.product.price;
  //       totalAmount += pro.product.price * counter;
  //       element.count = counter;
  //     }
  //   });
  //   notifyListeners();
  // }
}
