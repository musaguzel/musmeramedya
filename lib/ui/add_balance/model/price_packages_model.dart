import 'package:json_annotation/json_annotation.dart';
part 'price_packages_model.g.dart';


@JsonSerializable()
class PricePackagesModel {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subtitle')
  String subtitle;

  @JsonKey(name: 'price')
  String  price;





  PricePackagesModel({required this.title, required this.subtitle,required this.price});

  factory PricePackagesModel.fromJson(Map<String,dynamic> json) => _$PricePackagesModelFromJson(json);
  Map<String,dynamic> toJson() => _$PricePackagesModelToJson(this);


}