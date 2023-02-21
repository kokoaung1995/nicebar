import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nicebar/Datail.dart';
import 'package:provider/provider.dart';

import 'Product_model.dart';
import 'darkmoodtheme/darkmood.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String defaultId = "5qfZPkRRQrwTLfXKs78Y";
  Future<QuerySnapshot<Map<String, dynamic>>> categoryProducts =
      FirebaseFirestore.instance
          .collection("products")
          .where("category", isEqualTo: "5qfZPkRRQrwTLfXKs78Y")
          .get();

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> categories =
        FirebaseFirestore.instance.collection("categories").snapshots();
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            Switch(
              value: context.watch<ThemeProvider>().isDarkTheme,
              onChanged: (value) {
                if (value) {
                  context.read<ThemeProvider>().setDarkTheme();
                } else {
                  context.read<ThemeProvider>().setLightTheme();
                }
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                StreamBuilder(
                    stream: categories,
                    builder:
                        ((context, AsyncSnapshot<QuerySnapshot> snapshots) {
                      if (snapshots.data == null) {
                        return const Center(
                          child: Text("Data is loading"),
                        );
                      }
                      return SizedBox(
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    categoryProducts = FirebaseFirestore
                                        .instance
                                        .collection("products")
                                        .where("category",
                                            isEqualTo:
                                                snapshots.data!.docs[index].id)
                                        .get();
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                      "${snapshots.data!.docs[index]['name']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.red)),
                                ),
                              );
                            }),
                      );
                    })),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                    future: categoryProducts,
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshots) {
                      if (snapshots.data == null) {
                        return const Center(
                          child: Text("Data is loading"),
                        );
                      }
                      return Container(
                        height: 500,
                        child: ListView.builder(
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Product product = Product(
                                      snapshots.data!.docs[index]['name'],
                                      snapshots.data!.docs[index].id,
                                      snapshots.data!.docs[index]['price'],
                                      snapshots.data!.docs[index]
                                          ['description'],
                                      snapshots.data!.docs[index]['img'],
                                      snapshots.data!.docs[index]['shop']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Datail(
                                              snapshots.data!.docs[index].id,
                                              product)));
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 15,
                                        bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 20)
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                    "${snapshots.data!.docs[index]['name']}",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    "${snapshots.data!.docs[index]['price']}MMK ",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Image.network(
                                              "${snapshots.data!.docs[index]['img']}",
                                              scale: 1.1,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            }),
                      );
                    },
                  )),
                ),
              ],
            ),
          ],
        ));
  }
}
