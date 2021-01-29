// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String,
    imagePath: json['imagePath'] as String,
    isAvailable: json['isAvailable'] as bool,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    discountedPrice: (json['discountedPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isAvailable': instance.isAvailable,
      'name': instance.name,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
    };
