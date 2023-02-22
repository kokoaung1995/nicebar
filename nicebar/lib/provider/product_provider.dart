import 'package:flutter/cupertino.dart';
import 'package:nicebar/main.dart';
import 'package:nicebar/model/category.dart';
import 'package:nicebar/model/product.dart';
import 'package:nicebar/service/cloud_firestore.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Category> categories = [];

  Future<void> getProducts() async {
    products = await NiceBarServerService.fetchProducts();

    notifyListeners();
  }

  Future<void> getCategories() async {
    categories = await NiceBarServerService.fetchCategories();
    notifyListeners();
  }

  Stream<List<Product>> getProductStream() {
    return NiceBarServerService.connectProducts();
  }

  Stream<List<Category>> getCategoryStream() {
    return NiceBarServerService.connectCategoryStream();
  }
}
