import 'package:get_it/get_it.dart';
import 'package:restaurant_demo/service/cartservice.dart';
import 'package:restaurant_demo/service/product_holder_service.dart';

import 'models/cart.dart';

GetIt locator = GetIt.instance;

class InstanceLocator {
  void setupLocator() {
    locator.registerLazySingleton(() => new CartService(Cart(products: {}, productsQty: {})));
    locator.registerLazySingleton(() => new ProductHolderService());
  }
}