import 'dart:collection';

import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/models/product.dart';
import 'package:restaurant_demo/service/cartservice.dart';

class Cart {
  Map<String, Product> products = new HashMap();
  Map<String, int> productsQty = new HashMap();


  Cart({this.products, this.productsQty});

  void setProduct(Product product, int qty) {
    if(qty < 0) {
      return;
    }
    if(qty == 0) {
      productsQty.remove(product.id);
      products.remove(product.id);
    } else {
      productsQty[product.id] = qty;
      products[product.id] = product;
    }

    GetIt.I<CartService>().cachedCart = this;
  }

  double getTotal() {
    double total = 0;
    products.forEach((key, value) {
      total = total + (value.price * productsQty[key]);
    });
    return total;
  }
}
