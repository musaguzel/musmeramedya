// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_packages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricePackagesModel _$PricePackagesModelFromJson(Map<String, dynamic> json) =>
    PricePackagesModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$PricePackagesModelToJson(PricePackagesModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
    };
