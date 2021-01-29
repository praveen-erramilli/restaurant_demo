import 'package:flutter/material.dart';
import 'package:restaurant_demo/theme.dart';

import 'ui/products/products_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: MyTheme().getThemeData(),
        home: ProductsListScreen());
  }
}