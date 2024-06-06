import 'package:ecommerce_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ShopController extends ChangeNotifier {
  String collectionPath = "products";
  //user cart
  final List<Product> _cart = [];
  List<Product> shop = [];

  //get user cart
  List<Product> get cart => _cart;
  Future<void> getAllProductsFromFirestore() async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection(collectionPath);

    try {
      final querySnapshot = await collectionRef.get();
      final products =
          querySnapshot.docs.map((doc) => Product.fromMap(doc.data())).toList();
      shop = products;
      notifyListeners();
    } on FirebaseException catch (error) {
      // Handle error retrieving documents
      print("Error getting products: $error");
      // Return empty list on error
    }
  }

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromcart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}

ShopController shopController = ShopController();
