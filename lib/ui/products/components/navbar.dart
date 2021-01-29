import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/constants.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/service/cartservice.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  CartService cartService = GetIt.I<CartService>();

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
          return buildCard(context, cart);
        });
  }

  Card buildCard(BuildContext context, Cart cart) {
    return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Text('$kRupee ${cart?.getTotal()??0}', style:  Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),),
        trailing: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF3D459F))), child: Text('Place Order', style: TextStyle(color: Colors.white),),),
      ),
    ),
  );
  }
}
