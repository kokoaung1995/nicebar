import 'package:flutter/material.dart';
import 'package:nicebar/common/functions.dart';
import 'package:nicebar/component/cart_item_widget.dart';
import 'package:nicebar/main.dart';
import 'package:nicebar/model/record.dart';
import 'package:nicebar/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(builder: (context, listener, oldWidget) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: getCartItemInterset(listener.carts).length,
                  itemBuilder: (context, index) {
                    final cartProduct = getCartItemInterset(listener.carts)[index];
                    return CartItemWidget(product: cartProduct, quantity: getQuantityOf(cartProduct.id, listener.carts));
                  });
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Total Amount",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Consumer<CartProvider>(
                builder: (context, listener, oldWidget) => Text(
                  "${getTotal(listener.carts)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(10)),
            child: Consumer<CartProvider>(
              builder: (context, listener, oldWidget) => TextButton(
                  onPressed: () {
                    print(">>> ${listener.carts.length} : ${listener.carts}");
                    final record = Record(date: DateTime.now(), products: listener.carts);
                    recordProvider.addRecord(record);

                    cartProvider.resetCart();
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(color: Colors.limeAccent),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
