import 'package:json_annotation/json_annotation.dart';
part 'orders_model.g.dart';


@JsonSerializable()
class OrdersModel {

  @JsonKey(name: 'user_id')
  String userID;

  @JsonKey(name: 'date')
  DateTime datetime;

  @JsonKey(name: 'service_name')
  String  serviceName;

  @JsonKey(name: 'service_price')
  String  servicePrice;

  @JsonKey(name: 'service_amount')
  String serviceAmount;

  @JsonKey(name: 'social_media_link')
  String socialMediaLink;

  @JsonKey(name: 'social_media_name')
  String socialMediaName;

  @JsonKey(name: 'status')
  bool  status;


  OrdersModel({required this.userID, required this.datetime,required this.serviceName
    ,required this.servicePrice,required this.serviceAmount, required this.socialMediaLink,required this.socialMediaName,required this.status});

  factory OrdersModel.fromJson(Map<String,dynamic> json) => _$OrdersModelFromJson(json);
  Map<String,dynamic> toJson() => _$OrdersModelToJson(this);


}