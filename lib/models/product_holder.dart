import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_demo/models/product.dart';

part 'product_holder.g.dart';

@JsonSerializable()
class ProductHolder {
  List<Product> products;

  ProductHolder({this.products = const []});

  factory ProductHolder.fromJson(Map<String, dynamic> json) =>
      _$ProductHolderFromJson(json);

  Map<String, dynamic> toJson() => _$ProductHolderToJson(this);
}