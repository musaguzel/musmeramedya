// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMediaServiceModel _$SocialMediaServiceModelFromJson(
        Map<String, dynamic> json) =>
    SocialMediaServiceModel(
      categoryName: json['category_name'] as String,
      serviceNames: (json['service_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      servicePrice: (json['service_price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      serviceAverageTime: (json['service_average_times'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      socialMediaName: json['social_media_name'] as String,
    );

Map<String, dynamic> _$SocialMediaServiceModelToJson(
        SocialMediaServiceModel instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      'service_names': instance.serviceNames,
      'service_price': instance.servicePrice,
      'service_average_times': instance.serviceAverageTime,
      'social_media_name': instance.socialMediaName,
    };
