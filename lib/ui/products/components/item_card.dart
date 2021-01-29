import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/constants.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/ui/products/components/counter.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Cart cart;

  ItemCard({this.product, this.cart});

  @override
  Widget build(BuildContext context) {
    return buildCard(cart);
  }

  Card buildCard(Cart cart) {
    return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage(product.imagePath),),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Text(product.name, style: TextStyle(fontWeight: FontWeight.bold),),
          CartCounter(setQty: (int qty){
            cart.setProduct(product, qty);
          },
            currentQty: cart.productsQty[product.id]??0,
          ),
          SizedBox(height: 10,),
        ],
      ),
      // subtitle: CartCounter(setQty: (){},),
      trailing: Column(
        children: [
          SizedBox(height: 23,),
          Text('$kRupee ${product.price}'),
        ],
      ),
    ),
  );
  }
}
