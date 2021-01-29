import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product_holder.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/prouct_holder_service.dart';
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: ListView.builder(
                  itemCount: productHolder?.products?.length ?? 0,
                  itemBuilder: (context, index) => ItemCard(
                      product: productHolder.products[index], cart: cart),
                ),
              ),
            );
          else
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_scanner_sharp,
                    size: 200,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF3D459F))),
                      onPressed: () {
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRViewExample(
                                        onScan: (String data) {
                                          Map<String, dynamic> map =
                                              json.decode(data);
                                          ProductHolder productHolder =
                                              ProductHolder.fromJson(map);
                                          GetIt.I<ProductHolderService>()
                                                  .cachedProductHolder =
                                              productHolder;
                                          GetIt.I<CartService>().cachedCart =
                                              Cart(
                                                  products: {},
                                                  productsQty: {});
                                        },
                                      )));
                        }
                      },
                      child: Text('Scan QR Code'))
                ],
              ),
            );
        });
  }
}
