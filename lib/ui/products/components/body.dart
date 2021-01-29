import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product_holder.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/prouct_holder_service.dart';
import 'package:restaurant_demo/ui/products/components/item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CartService cartService = GetIt.I<CartService>();


  @override
  void dispose() {
    cartService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: cartService,
        builder: (BuildContext context, Cart cart, Widget child) {
          ProductHolder productHolder = GetIt.I<ProductHolderService>().cachedProductHolder;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: ListView.builder(
                itemCount: productHolder?.products?.length ?? 0,
                itemBuilder: (context, index) => ItemCard(
                  product: productHolder.products[index], cart: cart
                ),
              ),
            ),
          );
        });
  }
}
