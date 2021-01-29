import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product.dart';
import 'package:restaurant_demo/models/product_holder.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/prouct_holder_service.dart';
import 'package:restaurant_demo/service/qr_scanner_service.dart';

import '../../constants.dart';
import 'components/body.dart';
import 'components/navbar.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key key}) : super(key: key);

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20,),
                Icon(Icons.fastfood),
                SizedBox(width: 10,),
                Text(
                  'Menu',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
              ],
            )),
        actions: [
          IconButton(icon: Icon(Icons.qr_code_scanner_sharp), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewExample(onScan: (String data) {
              Map<String, dynamic> map = json.decode(data);
              ProductHolder productHolder = ProductHolder.fromJson(map);
              GetIt.I<ProductHolderService>().cachedProductHolder = productHolder;
              GetIt.I<CartService>().cachedCart = Cart(products: {}, productsQty: {});
              setState(() {

              });
            },)));
          })
        ],
      ),
      body: Body(),
      bottomNavigationBar: NavBar(),
    );
  }
}
