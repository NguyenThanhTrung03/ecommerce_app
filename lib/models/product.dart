class Product {
  final String id;
  final String name;
  final int price;
  final String description;
  final String imageUrl; // Thêm thuộc tính imageUrl

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl, // Thêm tham số imageUrl vào constructor
  });

  // Chuyển đổi đối tượng Product thành map để đẩy lên Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'image_url': imageUrl, // Thêm imageUrl vào map
    };
  }

  // Chuyển đổi map thành đối tượng Product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      imageUrl: map['image_url'], // Lấy imageUrl từ map
    );
  }
}
