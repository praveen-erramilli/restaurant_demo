
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product{
  String id;
  String imagePath;
  bool isAvailable;
  String name;
  double price;
  double discountedPrice;


  Product({this.id, this.imagePath, this.isAvailable, this.name, this.price,
      this.discountedPrice});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}