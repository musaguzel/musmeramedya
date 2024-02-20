import 'package:json_annotation/json_annotation.dart';
part 'price_packages_model.g.dart';


@JsonSerializable()
class PaymentInfoModel {

  @JsonKey(name: 'iban')
  String iban;

  @JsonKey(name: 'namesurname')
  String nameSurname;

  @JsonKey(name: 'payment_method')
  List<String> paymentMethod;

  @JsonKey(name: 'prices')
  List<String>  prices;

  @JsonKey(name: 'discounts')
  List<String>  discounts;









  PaymentInfoModel({required this.iban, required this.nameSurname,required this.paymentMethod,required this.prices,required this.discounts});

  factory PaymentInfoModel.fromJson(Map<String,dynamic> json) => _$PaymentInfoModelFromJson(json);
  Map<String,dynamic> toJson() => _$PaymentInfoModelToJson(this);


}