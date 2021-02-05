import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product.dart';
import 'package:restaurant_demo/models/product_holder.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/product_holder_service.dart';
import 'package:restaurant_demo/service/qr_scanner_service.dart';
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
          ProductHolder productHolder =
              GetIt.I<ProductHolderService>().cachedProductHolder;
          if (productHolder != null && productHolder.products.isNotEmpty)
            return buildProductsList(productHolder, cart);
          else
            return buildCenter(context);
        });
  }

  Widget buildProductsList(ProductHolder productHolder, Cart cart) {
    Map<String, List<Product>> grouping = groupBy<Product, String>(
        productHolder.products, (Product p) => p.category);
    List<Widget> li = [];

    for (String cat in grouping.keys) {
      li.add(
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(cat, style: TextStyle(fontWeight: FontWeight.bold),),
          ));
      for (Product product in grouping[cat]) {
        li.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemCard(product: product, cart: cart),
        ));
      }
    }
    return ListView( children: li,);
  }

  Center buildCenter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.qr_code_scanner_sharp,
            size: 200,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF3D459F))),
              onPressed: () {
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QRViewExample(
                                onScan: (String data) {
                                  Map<String, dynamic> map = json.decode(data);
                                  ProductHolder productHolder =
                                      ProductHolder.fromJson(map);
                                  GetIt.I<ProductHolderService>()
                                      .cachedProductHolder = productHolder;
                                  GetIt.I<CartService>().cachedCart =
                                      Cart(products: {}, productsQty: {});
                                },
                              )));
                }
              },
              child: Text('Scan QR Code'))
        ],
      ),
    );
  }
}
