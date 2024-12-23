class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({required this.id, required this.name, required this.description, required this.price, required this.imageUrl});

  // Fungsi untuk membuat objek Product dari JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['image_url'],
    );
  }
}
