import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../model/invited_friends_history_model.dart';
part 'invite_system_page_view_model.g.dart';

class InviteSystemPageViewModel = _InviteSystemPageViewModelBase with _$InviteSystemPageViewModel;

abstract class _InviteSystemPageViewModelBase with Store, BaseViewModel {

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    getInvitedFriendsHistory();
  }


  @observable
  ObservableList<InvitedFriendsHistoryModel> invitedFriendsHistoryList = ObservableList<InvitedFriendsHistoryModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> getInvitedFriendsHistory() async {
    try{

      isLoading = true; // Veri alımı başladığında isLoading'ı true olarak ayarla.

      var querySnapshot = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .collection('invited_friends').orderBy('invited_user_date',descending: true)
          .get();

      invitedFriendsHistoryList.clear(); // Önceki verileri temizle

      for (var doc in querySnapshot.docs) {
        // Firestore dokümanlarını dön ve InvitedFriendsHistoryModel oluşturarak listeye ekle
        var invitedFriend = InvitedFriendsHistoryModel.fromJson(doc.data());
        invitedFriendsHistoryList.add(invitedFriend);
      }

      isLoading = false; // Veri alımı tamamlandığında isLoading'ı false olarak ayarla.

    }catch(e){
      print(e.toString());
      isLoading = false;
    }
  }
}