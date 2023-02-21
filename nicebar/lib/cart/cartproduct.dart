import 'package:flutter/material.dart';

import '../Product_model.dart';

/*this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        this.cartProduct.remove(element);  }
    });*/

class CartProduct {
  int count;
  Product product;

  CartProduct(this.count, this.product);
}

class Cart with ChangeNotifier {
  List<CartProduct> cartProduct = [];

  dynamic totalAmount = 0;

  deleteProduct(CartProduct pro) {
    this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        totalAmount -= element.product.price * element.count;

        this.cartProduct.remove(element);

        notifyListeners();
      }
    });

    //this.cartProduct
    // .removeWhere((element) => element.product.id == pro.product.id);

    notifyListeners();
  }

  List<CartProduct> getList() {
    return cartProduct;
  }

  add(CartProduct cartPro) {
    cartProduct.add(cartPro);
    totalAmount += cartPro.count * cartPro.product.price;
    notifyListeners();
  }

  getLength() {
    return cartProduct.length;
  }

  has(CartProduct pro) {
    int states = 0;
    this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        states = 1;
      }
    });
    if (states == 1) {
      return true;
    }
    return false;
  }

  int getCount(CartProduct pro) {
    int count = 0;
    this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        count = element.count;
      }
    });
    return count;
  }

  updateProduct(CartProduct pro, int counter) {
    cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        totalAmount -= element.count * element.product.price;
        totalAmount += pro.product.price * counter;
        element.count = counter;
      }
    });
    notifyListeners();
  }
}
