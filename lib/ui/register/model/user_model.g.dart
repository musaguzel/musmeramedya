// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullname'] as String,
      email: json['email'] as String,
      balance: json['balance'] as int,
      userID: json['userID'] as String?,
      referenceCode: json['reference_code'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.fullName,
      'email': instance.email,
      'balance': instance.balance,
      'userID': instance.userID,
      'reference_code': instance.referenceCode,
    };
