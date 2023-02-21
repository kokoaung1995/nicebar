import 'package:flutter/material.dart';
import 'package:nicebar/Product_model.dart';
import 'package:nicebar/cart/cartproduct.dart';
import 'package:provider/provider.dart';

import 'Cartview.dart';

class Datail extends StatefulWidget {
  String id;
  Product product;
  Datail(this.id, this.product, {super.key});
  @override
  State<Datail> createState() => _DatailState();
}

class _DatailState extends State<Datail> {
  int count = 0;
  int updatecount = 0;
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cartview()));
              },
              child: Icon(Icons.shopping_cart_sharp)),
          Padding(padding: EdgeInsets.all(1)),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                '${cart.getLength()}',
                style:
                    TextStyle(color: Colors.white, backgroundColor: Colors.red),
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
              widget.product.nmae,
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
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
                                if (count != 0) {
                                  setState(() {
                                    count--;
                                  });
                                }
                                if (updatecount +
                                        cart.getCount(CartProduct(
                                            count, widget.product)) !=
                                    0) {
                                  setState(() {
                                    updatecount--;
                                  });
                                }
                              },
                              child: Icon(Icons.remove_circle)),
                          SizedBox(width: 10),
                          cart.has(CartProduct(count, widget.product))
                              ? Text(
                                  "${updatecount + cart.getCount(CartProduct(count, widget.product))}",
                                  style: TextStyle(fontSize: 20),
                                )
                              : Text(
                                  "$count",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                                if (cart
                                    .has(CartProduct(count, widget.product))) {
                                  setState(() {
                                    updatecount++;
                                  });
                                }
                              },
                              child: Icon(Icons.add_circle)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              CartProduct cartProduct =
                                  CartProduct(count, widget.product);
                              if (cart.has(cartProduct)) {
                                cart.updateProduct(
                                    cartProduct,
                                    updatecount +
                                        cart.getCount(CartProduct(
                                            count, widget.product)));
                                setState(() {
                                  updatecount = 0;
                                });
                              } else {
                                cart.add(cartProduct);
                              }
                            },
                            child: Text("Add To Cart")))
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
