import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'balance')
  double balance;

  @JsonKey(name: 'userID')
  String? userID;

  @JsonKey(name: 'reference_code')
  String? referenceCode;

  @JsonKey(name: 'friends_reference_code')
  String? friendsReferenceCode;

  UserModel({required this.fullName, required this.email,  required this.balance,required this.userID,required this.referenceCode,this.friendsReferenceCode});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
