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

  @JsonKey(name: 'selected_payment_discount')
  String  selectedPaymentDiscount;

  @JsonKey(name: 'total_payment')
  String  totalPayment;

  @JsonKey(name: 'date')
  DateTime  date;








  PaymentModel({required this.userId, required this.userName,required this.selectedPaymentMethod,
    required this.selectedPaymentTotal,required this.selectedPaymentDiscount,required this.totalPayment,required this.date});

  factory PaymentModel.fromJson(Map<String,dynamic> json) => _$PaymentModelFromJson(json);
  Map<String,dynamic> toJson() => _$PaymentModelToJson(this);


}