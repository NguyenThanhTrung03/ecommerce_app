import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //user cart
  final List<Product> _cart = [];
  List<Product> shop = [];

  //get user cart
  List<Product> get cart => _cart;

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
