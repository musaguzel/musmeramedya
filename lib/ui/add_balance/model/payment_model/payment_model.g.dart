// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      selectedPaymentMethod: json['selected_payment_method'] as String,
      selectedPaymentTotal: json['selected_payment_total'] as String,
      selectedPaymentDiscount: json['selected_payment_discount'] as String,
      totalPayment: json['total_payment'] as String,
      date: json['date'] as String,
      isCancelled: json['isCancelled'] as bool,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'selected_payment_method': instance.selectedPaymentMethod,
      'selected_payment_total': instance.selectedPaymentTotal,
      'selected_payment_discount': instance.selectedPaymentDiscount,
      'total_payment': instance.totalPayment,
      'date': instance.date,
      'isCancelled': instance.isCancelled,
      'status': instance.status,
    };
