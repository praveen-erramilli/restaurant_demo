import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/constants.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product_holder.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/product_holder_service.dart';

class MyTimer extends StatefulWidget {
  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 12;

  int currentSeconds = 0;
  bool _isTimerVisible = true;

  String get timerText =>
      '00 : ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          _isTimerVisible = false;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Visibility(
          child: Visibility(
            child: Container(
              width: 100,
              height: 100,
              decoration:
                  ShapeDecoration(shape: CircleBorder(), color: kPrimaryColor),
              child: Center(
                  child: Text(
                timerText,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          visible: _isTimerVisible,
        ),
        Visibility(
            visible: !_isTimerVisible,
            child: ElevatedButton.icon(
                onPressed: () {
                  GetIt.I<ProductHolderService>().cachedProductHolder = ProductHolder();
                  GetIt.I<CartService>().cachedCart = Cart(products: {}, productsQty: {});
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: Icon(
                  Icons.fastfood,
                  size: 30,
                ),
                label: Text("Checkout Online"))),
        SizedBox(
          width: 20,
        ),
        Visibility(
            visible: !_isTimerVisible,
            child: ElevatedButton.icon(
                onPressed: () {
                  GetIt.I<ProductHolderService>().cachedProductHolder = ProductHolder();
                  GetIt.I<CartService>().cachedCart = Cart(products: {}, productsQty: {});
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: Icon(
                  Icons.fastfood,
                  size: 30,
                ),
                label: Text("Checkout at Restaurant"))),
      ])),
    );
  }
}
