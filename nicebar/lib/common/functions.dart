import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nicebar/model/product.dart';

void setSystemUIOverlay() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white),
  );
}


List<Product> getCartItemInterset(List<Product> orignalList) {
    List<Product> intersetCart = [];
    List<String> allIDs = orignalList.map((e) => e.id).toList();

    allIDs.toSet().forEach((id) {
      intersetCart.add(orignalList.firstWhere((element) => element.id == id));
    });

    return intersetCart;
}

int getTotal(List<Product> productList) {
    int total = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    productList.forEach((element) {
      total += element.price;
    });
    return total;
}


  int getQuantityOf(String productID,List<Product> productList) {
    int quantity = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    productList.forEach((element) {
      if (element.id == productID) {
        quantity++;
      }
    });
    return quantity;
  }


