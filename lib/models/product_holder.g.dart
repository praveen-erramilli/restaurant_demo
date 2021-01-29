// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_holder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductHolder _$ProductHolderFromJson(Map<String, dynamic> json) {
  return ProductHolder(
    products: (json['products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductHolderToJson(ProductHolder instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
