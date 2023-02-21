import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart/cartproduct.dart';

class Cartview extends StatefulWidget {
  const Cartview({super.key});

  @override
  State<Cartview> createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("cartview"),
      ),
      body: Column(children: [
        ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: cart.getLength(),
            itemBuilder: (context, index) {
              return Card(
                child: Expanded(
                  child: Row(
                    children: [
                      Image.network(
                        cart.getList()[index].product.img,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                              child: Text(
                            cart.getList()[index].product.nmae,
                            style: TextStyle(),
                          )),
                          Container(
                            child: Text(
                                "${cart.getList()[index].product.price}MMK"),
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      Text("${cart.getList()[index].count}"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "${cart.getList()[index].count * cart.getList()[index].product.price}"),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              cart.deleteProduct(cart.getList()[index]);
                            });
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              );
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Total Amount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${cart.totalAmount}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                "Checkout",
                style: TextStyle(color: Colors.limeAccent),
              )),
        )
      ]),
    );
  }
}
