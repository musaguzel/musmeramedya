import 'package:json_annotation/json_annotation.dart';
part 'payment_model.g.dart';


@JsonSerializable()
class PaymentModel {

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'user_name')
  String userName;

  @JsonKey(name: 'selected_payment_method')
  String  selectedPaymentMethod;

  @JsonKey(name: 'selected_payment_total')
  String  selectedPaymentTotal;

  @JsonKey(name: 'selected_payment_bonus')
  String  selectedPaymentBonus;

  @JsonKey(name: 'bonus_plus_total')
  String  bonusPlusTotal;

  @JsonKey(name: 'date')
  String  date;

  @JsonKey(name: 'isCancelled')
  bool  isCancelled;

  @JsonKey(name: 'status')
  bool  status;








  PaymentModel({required this.userId, required this.userName,required this.selectedPaymentMethod,
    required this.selectedPaymentTotal,required this.selectedPaymentBonus,required this.bonusPlusTotal,required this.date,required this.isCancelled,required this.status});

  factory PaymentModel.fromJson(Map<String,dynamic> json) => _$PaymentModelFromJson(json);
  Map<String,dynamic> toJson() => _$PaymentModelToJson(this);


}