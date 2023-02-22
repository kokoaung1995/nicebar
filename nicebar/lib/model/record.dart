import 'package:nicebar/model/product.dart';

class Record {
  DateTime date;
  List<Product> products;

  Record({required this.date, required this.products});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
      products: List<dynamic>.from(json["products"]).map((e) => Product.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date.millisecondsSinceEpoch,
      "products": products.map((p) => p.toJson()).toList(),
    };
  }
}
