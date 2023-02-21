class Product {
  String nmae, id;
  int price;
  String description;
  String img;
  String shop;

  Product(
      this.nmae, this.id, this.price, this.description, this.img, this.shop);
}

class Products {
  final String name;
  final int price;

  Products({required this.name, required this.price});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        name: json['name'] ?? "no name", price: json['price'] ?? "no price");
  }
  Map<String, dynamic> toJson() {
    return {"name": name, "price": price};
  }
}
/*InkWell(onTap: () {
                                          Product product = Product(
                                              snapshots.data!.docs[index]
                                                  ['name'],
                                              snapshots.data!.docs[index]
                                                  ['price'],
                                              snapshots.data!.docs[index]
                                                  ['description'],
                                              snapshots.data!.docs[index]
                                                  ['img'],
                                              snapshots.data!.docs[index]
                                                  ['shop']);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Datail(
                                                      snapshots
                                                          .data!.d*/