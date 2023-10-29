import 'package:json_annotation/json_annotation.dart';
part 'social_media_service_model.g.dart';


@JsonSerializable()
class SocialMediaServiceModel {

  @JsonKey(name: 'category_name')
  String categoryName;

  @JsonKey(name: 'service_names')
  List<String> serviceNames;

  @JsonKey(name: 'service_price')
  List<String>  servicePrice;

  @JsonKey(name: 'service_average_times')
  List<String> serviceAverageTime;

  @JsonKey(name: 'social_media_name')
  String socialMediaName;

  SocialMediaServiceModel({required this.categoryName, required this.serviceNames
  ,required this.servicePrice,required this.serviceAverageTime, required this.socialMediaName});

  factory SocialMediaServiceModel.fromJson(Map<String,dynamic> json) => _$SocialMediaServiceModelFromJson(json);
  Map<String,dynamic> toJson() => _$SocialMediaServiceModelToJson(this);


}