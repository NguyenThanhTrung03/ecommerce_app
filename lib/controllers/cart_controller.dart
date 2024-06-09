import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';

class CartController extends ChangeNotifier {
  final Shop shop;

  CartController(this.shop);

  int get totalPrice {
    return shop.cart.fold(0, (sum, item) => sum + item.price);
  }

  void removeItemFromCart(Product product) {
    shop.removeFromcart(product);
    notifyListeners();
  }

  // void navigateToPayment(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PaymentPage(totalPrice: totalPrice),
  //     ),
  //   );
  // }
}
