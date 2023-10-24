import 'package:json_annotation/json_annotation.dart';
part 'social_media_service_model.g.dart';


@JsonSerializable()
class SocialMediaServiceModel {

  @JsonKey(name: 'category_name')
  String categoryName;

  @JsonKey(name: 'service_name')
  String serviceName;

  @JsonKey(name: 'service_price')
  String servicePrice;

  @JsonKey(name: 'service_average_time')
  String serviceAverageTime;

  SocialMediaServiceModel({required this.categoryName, required this.serviceName
  ,required this.servicePrice,required this.serviceAverageTime});

  factory SocialMediaServiceModel.fromJson(Map<String,dynamic> json) => _$SocialMediaServiceModelFromJson(json);
  Map<String,dynamic> toJson() => _$SocialMediaServiceModelToJson(this);


}