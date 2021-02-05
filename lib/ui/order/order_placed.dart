import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/models/cart.dart';
import 'package:restaurant_demo/models/product_holder.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/prouct_holder_service.dart';
import 'dart:async';
class timer extends StatefulWidget {
  @override
  _timerState createState() => _timerState();
}

class _timerState extends State<timer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 12;

  int currentSeconds = 0;
  bool  _isVisible = true;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 12).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
    //_isVisible=false;
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Column(
                      children: [
                        Visibility(
                          child: RaisedButton(
                            onPressed: () { setState(() {
                              _isVisible=false;
                            }); },
                            child: Visibility(child: Text(timerText),
                            ),
                          ),
                          visible: _isVisible,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Visibility(child: RaisedButton.icon(
                                splashColor: Colors.blue,
                                padding: EdgeInsets.all(30) ,
                                onPressed: () {}, icon: Icon(Icons.fastfood,size: 30,) , label: Text("Checkout Online",
                              style: TextStyle(
                                fontFamily: "Muli",
                                fontSize: 20,
                              ),)),
                              visible: _isVisible=true,),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [RaisedButton.icon(
                                splashColor: Colors.green,
                                padding: EdgeInsets.all(30) ,
                                onPressed: () {}, icon: Icon(Icons.fastfood, size: 30,) , label: Text("Checkout at Restaurant",
                              style: TextStyle(
                                fontFamily: "Muli",
                                fontSize: 20,
                              ),)
                            ),

                            ],),
                        )
                      ]
                  ),
                ],
              ))),
    );
  }
}



