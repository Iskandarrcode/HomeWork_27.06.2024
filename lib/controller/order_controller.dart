import 'package:flutter/material.dart';
import 'package:online_shop_animation/models/order.dart';
import 'package:online_shop_animation/models/product_model.dart';

class CartController extends ChangeNotifier {
  final Order _cart = Order(
    products: {},
    totalPrice: 0,
  );

  Order get cart {
    return _cart;
  }

  void addToCart(ProductModel product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }
    calculateTotal();
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.products.containsKey(productId)) {
      if (_cart.products[productId]["amount"] == 1) {
        _cart.products.removeWhere((key, value) {
          return key == productId;
        });
      } else {
        _cart.products[productId]["amount"]--;
      }
      calculateTotal();
      notifyListeners();
    }
  }

  void calculateTotal() {
    double total = 0;
    _cart.products.forEach((key, value) {
      total += value['product'].price * value['amount'];
    });
    _cart.totalPrice = total;
  }

  bool isInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]['amount'];
  }
}
