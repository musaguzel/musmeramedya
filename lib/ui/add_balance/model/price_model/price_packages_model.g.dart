// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_packages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInfoModel _$PaymentInfoModelFromJson(Map<String, dynamic> json) =>
    PaymentInfoModel(
      iban: json['iban'] as String,
      paymentMethod: (json['payment_method'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      prices:
          (json['prices'] as List<dynamic>).map((e) => e as String).toList(),
      discounts:
          (json['discounts'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PaymentInfoModelToJson(PaymentInfoModel instance) =>
    <String, dynamic>{
      'iban': instance.iban,
      'payment_method': instance.paymentMethod,
      'prices': instance.prices,
      'discounts': instance.discounts,
    };
