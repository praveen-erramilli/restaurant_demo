import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class CartCounter extends StatefulWidget {
  final Function setQty;
  final int currentQty;

  CartCounter({this.setQty, this.currentQty});

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (widget.currentQty >= 0) {
              HapticFeedback.heavyImpact();
              setState(() {
                widget.setQty(widget.currentQty-1);
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
              widget.currentQty.toString().padLeft(2, "0"),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              HapticFeedback.heavyImpact();
              setState(() {
                widget.setQty(widget.currentQty+1);
              });
            }),
      ],
    );
  }

  Widget buildOutlineButton({IconData icon, Function press}) {
    return ElevatedButton(
      onPressed: press,
      child: Icon(icon, color: Colors.black,),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.zero),
          overlayColor: MaterialStateProperty.all(Color(0xFFA7D7F2)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(CircleBorder())),
    );
  }
}
