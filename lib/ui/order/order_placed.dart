import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product_holder.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/prouct_holder_service.dart';

class OrderPlaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            GetIt.I<ProductHolderService>().cachedProductHolder = ProductHolder();
            GetIt.I<CartService>().cachedCart = Cart(products: {}, productsQty: {});
            Navigator.pop(context);
          },
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Checkmark.gif',
              ),
              Text('Order Placed Successfully')
            ],
          ))),
    );
  }
}
