class Product {
  String id;
  String name;
  int price;
  String description;
  String img;
  String shop;
  String category;

  Product(
      {required this.name,
      this.id = "",
      required this.price,
      required this.description,
      required this.img,
      required this.shop,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? "no-id",
      name: json['name'] ?? "Name",
      price: json['price'] ?? 0,
      description: json['description'] ?? "Des",
      img: json['img'] ?? "img",
      shop: json['shop'] ?? "shop",
      category: json['category'] ?? "category",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "description": description,
      "img": img,
      "shop": shop,
      "category": category,
    };
  }

  @override
  bool operator ==(Object other) {
    bool isSame = identical(this, other) && other.runtimeType == runtimeType && other is Product && other.name == name && other.id == id;

    return isSame;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

// class Products {
//   final String name;
//   final int price;

//   Products({required this.name, required this.price});

//   factory Products.fromJson(Map<String, dynamic> json) {
//     return Products(name: json['name'] ?? "no name", price: json['price'] ?? "no price");
//   }
//   Map<String, dynamic> toJson() {
//     return {"name": name, "price": price};
//   }
// }
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