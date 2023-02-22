import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nicebar/common/colors.dart';
import 'package:nicebar/common/constants.dart';
import 'package:nicebar/component/theme_switcher.dart';
import 'package:nicebar/main.dart';
import 'package:nicebar/model/category.dart';
import 'package:nicebar/provider/product_provider.dart';
import 'package:nicebar/screen/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Category currentCategory = Category("Drink", id: "4SjNV7s961dopvwlNngZ");

  @override
  void initState() {
    super.initState();
    productProvider.getProducts();
  }

  // String defaultId = "5qfZPkRRQrwTLfXKs78Y";
  // Future<QuerySnapshot<Map<String, dynamic>>> categoryProducts =
  //     FirebaseFirestore.instance.collection("products").where("category", isEqualTo: "5qfZPkRRQrwTLfXKs78Y").get();

  List<Product> sortProduct(List<Product> products, Category category) {
    final result = products.where((element) {
      return element.category == category.id;
    }).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            StreamBuilder(
                stream: productProvider.getCategoryStream(),
                builder: ((context, AsyncSnapshot<List<Category>> snapshots) {
                  if (snapshots.hasData) {
                    List<Category> categoryList = snapshots.data ?? [];

                    return Container(
                      height: 50,
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.4)),
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            final category = categoryList[index];
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  currentCategory = category;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                alignment: Alignment.center,
                                width: 100,
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                    color: currentCategory.id == category.id ? const Color.fromARGB(141, 255, 255, 255) : null),
                                child: Text(
                                  category.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: currentCategory.id == category.id ? Theme.of(context).primaryColor : null),
                                ),
                              ),
                            );
                          }),
                    );
                  }

                  return const SizedBox();
                })),
            Expanded(child: Consumer<ProductProvider>(
              builder: (context, listener, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: sortProduct(listener.products, currentCategory).length,
                  itemBuilder: (context, index) {
                    Product product = sortProduct(listener.products, currentCategory)[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product.id, product)));
                      },
                      child: Card(
                          margin: const EdgeInsets.all(20).copyWith(top: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
                                child: Image.network(
                                  product.img,
                                  width: double.maxFinite,
                                  height: 230,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(product.name, style: const TextStyle(color: Colors.red, fontSize: 20)),
                                  Text("${product.price} MMK ", style: TextStyle(color: Colors.red.withOpacity(0.5), fontWeight: FontWeight.bold))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                    );
                  },
                );
              },
            ))
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(appName),
      actions: const [ThemeSwitcherWidget()],
    );
  }

  // Widget buildBody() {
  //   return Stack(
  //     children: [
  //       Column(
  //         children: [
  //           StreamBuilder(
  //               stream: categories,
  //               builder: ((context, AsyncSnapshot<QuerySnapshot> snapshots) {
  //                 if (snapshots.data == null) {
  //                   return const Center(
  //                     child: Text("Data is loading"),
  //                   );
  //                 }
  //                 return SizedBox(
  //                   height: 50,
  //                   child: ListView.builder(
  //                       scrollDirection: Axis.horizontal,
  //                       itemCount: snapshots.data!.docs.length,
  //                       itemBuilder: (context, index) {
  //                         return InkWell(
  //                           onTap: () {
  //                             setState(() {
  //                               categoryProducts = FirebaseFirestore.instance
  //                                   .collection("products")
  //                                   .where("category", isEqualTo: snapshots.data!.docs[index].id)
  //                                   .get();
  //                             });
  //                           },
  //                           child: Container(
  //                             padding: const EdgeInsets.all(10),
  //                             child: Text("${snapshots.data!.docs[index]['name']}",
  //                                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.red)),
  //                           ),
  //                         );
  //                       }),
  //                 );
  //               })),
  //           const SizedBox(height: 20),
  //           Expanded(
  //             child: SingleChildScrollView(
  //                 child: FutureBuilder(
  //               future: categoryProducts,
  //               builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots) {
  //                 if (snapshots.data == null) {
  //                   return const Center(
  //                     child: Text("Data is loading"),
  //                   );
  //                 }
  //                 return Container(
  //                   height: 500,
  //                   child: ListView.builder(
  //                       itemCount: snapshots.data!.docs.length,
  //                       itemBuilder: (context, index) {
  //                         return InkWell(
  //                           onTap: () {
  //                             // Product product = Product(
  //                             //     snapshots.data!.docs[index]['name'],
  //                             //     snapshots.data!.docs[index].id,
  //                             //     snapshots.data!.docs[index]['price'],
  //                             //     snapshots.data!.docs[index]['description'],
  //                             //     snapshots.data!.docs[index]['img'],
  //                             //     snapshots.data!.docs[index]['shop']);
  //                             // Navigator.push(
  //                             //     context, MaterialPageRoute(builder: (context) => ProductDetailScreen(snapshots.data!.docs[index].id, product)));
  //                           },
  //                           child: Container(
  //                               margin: EdgeInsets.only(left: 20, top: 20, right: 15, bottom: 20),
  //                               decoration: BoxDecoration(
  //                                   color: Colors.white,
  //                                   borderRadius: BorderRadius.circular(10),
  //                                   boxShadow: [BoxShadow(offset: Offset(0, 4), blurRadius: 20)]),
  //                               child: Padding(
  //                                 padding: EdgeInsets.all(5),
  //                                 child: Column(
  //                                   children: [
  //                                     Container(
  //                                       child: Column(
  //                                         children: [
  //                                           Text("${snapshots.data!.docs[index]['name']}",
  //                                               style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
  //                                           Text("${snapshots.data!.docs[index]['price']}MMK ",
  //                                               style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     SizedBox(
  //                                       height: 20,
  //                                     ),
  //                                     Container(
  //                                       child: Image.network(
  //                                         "${snapshots.data!.docs[index]['img']}",
  //                                         scale: 1.1,
  //                                       ),
  //                                     )
  //                                   ],
  //                                 ),
  //                               )),
  //                         );
  //                       }),
  //                 );
  //               },
  //             )),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

}
