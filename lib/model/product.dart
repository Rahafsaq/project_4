class Product {
  final String imageUrl;
  final String title;
  final String price;

  const Product({required this.imageUrl, required this.title, required this.price});

  @override
  String toString() {
    return 'Product $title $imageUrl $price ';
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      imageUrl: map['imageUrl'],
      title: map['title'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
    };
  }
}

// class Data {
//   static final List<Product> Products = [
//     Product(
//       title: '',
//       imageUrl: '',
//       price: '',
//     ),
//   ];
// }
