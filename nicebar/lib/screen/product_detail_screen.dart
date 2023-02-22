import 'package:flutter/material.dart';
import 'package:nicebar/main.dart';
import 'package:nicebar/model/product.dart';
import 'package:nicebar/provider/cart_provider.dart';
import 'package:nicebar/screen/cart_page.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;
  final Product product;
  const ProductDetailScreen(this.id, this.product, {super.key});
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: const Icon(Icons.shopping_cart_sharp)),
          const Padding(padding: EdgeInsets.all(1)),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Consumer<CartProvider>(
                builder: (context, listener, oldWidget) => Text(
                  '${listener.carts.length}',
                  style: const TextStyle(color: Colors.white, backgroundColor: Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink,
                  border: Border.all(
                    color: Colors.black,
                  )),
              padding: EdgeInsets.all(20),
              child: Image.network(
                widget.product.img,
                scale: 1.1,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.product.price.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1),
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    color: Colors.pink,
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.product.description,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                // if (count != 0) {
                                //   setState(() {
                                //     count--;
                                //   });
                                // }
                                // if (updatecount + cartProvider.getCount(CartProduct(count, widget.product)) != 0) {
                                //   setState(() {
                                //     updatecount--;
                                //   });
                                // }
                                setState(() {
                                  count--;
                                });
                              },
                              child: const Icon(Icons.remove_circle)),
                          const SizedBox(width: 10),
                          // cartProvider.has(CartProduct(count, widget.product))
                          //     ? Text(
                          //         "${updatecount + cartProvider.getCount(CartProduct(count, widget.product))}",
                          //         style: TextStyle(fontSize: 20),
                          //       )
                          // :
                          Text(
                            "$count",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () {
                                // setState(() {
                                //   count++;
                                // });
                                // if (cartProvider.has(CartProduct(count, widget.product))) {
                                //   setState(() {
                                //     updatecount++;
                                //   });
                                // }
                                setState(() {
                                  count++;
                                });
                              },
                              child: const Icon(Icons.add_circle)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              // CartProduct cartProduct = CartProduct(count, widget.product);
                              // if (cartProvider.has(cartProduct)) {
                              //   cartProvider.updateProduct(cartProduct, updatecount + cartProvider.getCount(CartProduct(count, widget.product)));
                              //   setState(() {
                              //     updatecount = 0;
                              //   });
                              // } else {
                              //   cartProvider.add(cartProduct);
                              // }
                              for (int i = 0; i < count; i++) {
                                cartProvider.addProduct(widget.product);
                              }
                            },
                            child: const Text("Add To Cart")))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
