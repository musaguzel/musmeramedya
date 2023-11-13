import 'package:json_annotation/json_annotation.dart';
part 'invited_friends_history_model.g.dart';


@JsonSerializable()
class InvitedFriendsHistoryModel {

  @JsonKey(name: 'invited_user_date')
  String date;

  @JsonKey(name: 'invited_user_id')
  String invitedUserId;

  @JsonKey(name: 'invited_user_name')
  String invitedUserName;

  @JsonKey(name: 'earned_bonus')
  double  earnedBonus;







  InvitedFriendsHistoryModel({required this.date,required this.invitedUserId, required this.invitedUserName,required this.earnedBonus,});

  factory InvitedFriendsHistoryModel.fromJson(Map<String,dynamic> json) => _$InvitedFriendsHistoryModelFromJson(json);
  Map<String,dynamic> toJson() => _$InvitedFriendsHistoryModelToJson(this);


}