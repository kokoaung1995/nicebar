import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nicebar/model/category.dart';
import 'package:nicebar/model/product.dart';

class NiceBarServerService {
  static CollectionReference categoryCollection = FirebaseFirestore.instance.collection("categories");
  static CollectionReference productCollection = FirebaseFirestore.instance.collection("products");

  static Future<List<Product>> fetchProducts() async {
    final querySnapshot = await productCollection.get();
    List<Product> productList = querySnapshot.docs.map((docSnapshot) {
      final product = Product.fromJson(docSnapshot.data() as Map<String, dynamic>);
      product.id = docSnapshot.id;
      return product;
    }).toList();

    return productList;
  }

  static Future<List<Category>> fetchCategories() async {
    final querySnapshot = await categoryCollection.get();
    List<Category> categoryList = querySnapshot.docs.map((docSnapshot) {
      return Category.fromJson(docSnapshot.data() as Map<String, dynamic>);
    }).toList();

    return categoryList;
  }

  static Stream<List<Product>> connectProducts() {
    final querySnapshot = productCollection.snapshots();

    Stream<List<Product>> productStream = querySnapshot.map((querySnapshot) {
      List<Product> productList = querySnapshot.docs.map((docSnapshot) {
        final product = Product.fromJson(docSnapshot.data() as Map<String, dynamic>);
        product.id = docSnapshot.id;
        return product;
      }).toList();
      return productList;
    });

    return productStream;
  }

  static Stream<List<Category>> connectCategoryStream() {
    final querySnapshot = categoryCollection.snapshots();

    Stream<List<Category>> categoryStream = querySnapshot.map((querySnapshot) {
      List<Category> categoryList = querySnapshot.docs.map((docSnapshot) {
        final category = Category.fromJson(docSnapshot.data() as Map<String, dynamic>);
        category.id = docSnapshot.id;
        return category;
      }).toList();
      return categoryList;
    });

    return categoryStream;
  }
}
