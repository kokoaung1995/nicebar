import 'package:flutter/material.dart';
import 'package:nicebar/Product_model.dart';

class Datail extends StatefulWidget {
  String id;
  Product product;
  Datail(this.id, this.product);
  @override
  State<Datail> createState() => _DatailState();
}

class _DatailState extends State<Datail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Column(
        children: [Image.network(widget.product.img)],
      ),
    );
  }
}
