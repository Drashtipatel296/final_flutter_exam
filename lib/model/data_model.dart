class ProductModel {
  String id;
  String name;
  double price;

  ProductModel({required this.id, required this.name, required this.price});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
  };

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
}
