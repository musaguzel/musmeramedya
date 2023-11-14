import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import '../../../core/base/model/base_view_model.dart';
part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {

  final FocusNode focusNode = FocusNode();

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {

  }

  //ChangePasswordScreen

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @observable
  bool updatePasswordProcessIsLoading = false;

  @action
  Future<void> updatePassword(String email) async {
    try {
      updatePasswordProcessIsLoading = true;
      final User? user = firebaseAuth.currentUser;
      final AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: oldPasswordController.text,
      );
      await user?.reauthenticateWithCredential(credential).then((value) async =>
      {
        await firebaseAuth.currentUser?.updatePassword(
            newPasswordController.text),
        updatePasswordProcessIsLoading = false,
        showsnackbar(message: 'Şifreniz Güncellendi'),
        navigation.navigateToPageClear(path: NavigationConstants.PROFILE)
      });
    } catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'INVALID_LOGIN_CREDENTIALS') {
          showsnackbar(
              message: 'Mevcut şifreniz yanlış');
        }
      }
    }
  }

  //Account_Status Screen


  @observable
  bool isAccountDeleting = false;
  @action
  Future<void> deleteAccount() async {
    isAccountDeleting = true;
    if(firebaseAuth.currentUser != null) {
      try{
        await firebaseAuth.currentUser?.delete().then((value) async {
          try {
            final userDocRef = FirebaseFirestore.instance.collection('users').doc(userModelGlobal.userID);

            await userDocRef.delete().then((value) async {
              await deleteInviteCodes();
              final userCollectionRefPaymentHistory = userDocRef.collection('payment_history');
              final userCollectionRefOrdersHistory = userDocRef.collection('orders_history');
              final userCollectionRefInvitedFriends = userDocRef.collection('invited_friends');

              // Koleksiyon içindeki belgeleri sorgula ve sil
              final QuerySnapshot userSubcollectionSnapshotPaymentHistory = await userCollectionRefPaymentHistory.get();
              final QuerySnapshot userSubcollectionSnapshotOrdersHistory = await userCollectionRefOrdersHistory.get();
              final QuerySnapshot userSubcollectionInvitedFriends = await userCollectionRefOrdersHistory.get();

              try{
                if(userSubcollectionSnapshotPaymentHistory.docs.isNotEmpty){
                  for (QueryDocumentSnapshot doc in userSubcollectionSnapshotPaymentHistory.docs) {
                    await userCollectionRefPaymentHistory.doc(doc.id).delete();
                  }
                }
                if(userSubcollectionSnapshotOrdersHistory.docs.isNotEmpty){
                  for (QueryDocumentSnapshot doc in userSubcollectionSnapshotOrdersHistory.docs) {
                    await userCollectionRefOrdersHistory.doc(doc.id).delete();
                  }
                }
                if(userSubcollectionInvitedFriends.docs.isNotEmpty){
                  for (QueryDocumentSnapshot doc in userSubcollectionInvitedFriends.docs) {
                    await userCollectionRefOrdersHistory.doc(doc.id).delete();
                  }
                }
              }catch(e){
                print(e.toString());
                isAccountDeleting = false;
                showsnackbar(message: 'Hesabınızı silmek için uygulamayı yeniden başlatıp tekrar deneyin');
              }

            });

          } catch (e) {
            isAccountDeleting = false;
            print('Kullanıcı hesabı silinirken bir hata oluştu: $e');
          }
        });
      }catch(e){
        isAccountDeleting = false;
        print(e.toString());
      }

    }
    isAccountDeleting = false;
  }

  @observable
  bool? emailVerified;

  @action
  Future<void> getIsVerified () async {
    await firebaseAuth.currentUser?.reload();
    try{
      if(firebaseAuth.currentUser!.emailVerified){
        emailVerified = true;
      } else{
        emailVerified = false;
      }
    }catch(e){

    }
  }

  @observable
  bool canResendEmail = true;

  @action
  Future<void> sendVerificationEmail() async {
    try{
      final user = firebaseAuth.currentUser;
      await user?.sendEmailVerification();
      showsnackbar(message: 'E-mail Adresinize Doğrulama Linki Gönderildi');
      canResendEmail = false;
      Future.delayed(const Duration(minutes: 1));
      canResendEmail = true;
    }catch(error){
      if (error is FirebaseAuthException) {
        switch(error.code){
          case 'too-many-requests': showsnackbar(message: 'Çok Fazla İstekte Bulundunuz');
          break;
          default: showsnackbar(message: error.toString());
        }
      }
    }

  }

  @action
  Future<void> deleteInviteCodes() async {
    // Kullanıcıya ait davet kodlarını silin.
    final CollectionReference inviteCodesCollection =
    FirebaseFirestore.instance.collection('inviteCodes');
    QuerySnapshot querySnapshot = await inviteCodesCollection
        .where('userId', isEqualTo: firebaseAuth.currentUser?.uid)
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await inviteCodesCollection.doc(doc.id).delete();
    }
  }
}