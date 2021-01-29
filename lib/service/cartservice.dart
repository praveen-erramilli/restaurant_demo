import 'package:flutter/cupertino.dart';
import 'package:restaurant_demo/models/cart.dart';

class CartService extends ValueNotifier<Cart> {
  CartService(Cart value) : super(value);

  Cart get cachedCart => value;

  set cachedCart(Cart cart) {
    value = cart;
    notifyListeners();
  }
}