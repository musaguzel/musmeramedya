// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      userID: json['user_id'] as String,
      datetime: DateTime.parse(json['date'] as String),
      serviceName: json['service_name'] as String,
      servicePrice: json['service_price'] as String,
      serviceAmount: json['service_amount'] as String,
      socialMediaLink: json['social_media_link'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'user_id': instance.userID,
      'date': instance.datetime.toIso8601String(),
      'service_name': instance.serviceName,
      'service_price': instance.servicePrice,
      'service_amount': instance.serviceAmount,
      'social_media_link': instance.socialMediaLink,
      'status': instance.status,
    };
