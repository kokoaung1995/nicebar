class Category {
  String id;
  String name;
  Category(this.name, {this.id = ""});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(json["name"] ?? "Category");
  }

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}
