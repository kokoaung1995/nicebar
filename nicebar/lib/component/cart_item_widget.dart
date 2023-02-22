import 'package:flutter/material.dart';
import 'package:nicebar/main.dart';
import 'package:nicebar/model/product.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.product,required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Image.network(
          product.img,
          width: 100,
          height: 100,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                product.name,
                style: const TextStyle(),
              ),
              Text("${product.price} MMK")
            ],
          ),
        ),
        const SizedBox(width: 10),
        Text("Quantity\n[$quantity x  ${product.price}]"),
        IconButton(
            onPressed: () {
              cartProvider.removeProduct(product);
            },
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ))
      ],
    ));
  }
}
