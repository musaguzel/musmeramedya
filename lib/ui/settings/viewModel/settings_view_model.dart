import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';
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
        if (error.code == 'wrong-password') {
          showsnackbar(
              message: 'Şifreler Uyuşmuyor');
        }
      }
    }
  }

  //Account_Status Screen

  @action
  Future<void> deleteAccount() async {
    if(firebaseAuth.currentUser != null){
      try {
        final userDocRef = FirebaseFirestore.instance.collection('users').doc(firebaseAuth.currentUser?.uid);

        await userDocRef.delete().then((value) async {
          await deleteInviteCodes();
          final userCollectionRefPaymentHistory = userDocRef.collection('payment_history');
          final userCollectionRefOrdersHistory = userDocRef.collection('orders_history');

          // Koleksiyon içindeki belgeleri sorgula ve sil
          final QuerySnapshot userSubcollectionSnapshotPaymentHistory = await userCollectionRefPaymentHistory.get();
          final QuerySnapshot userSubcollectionSnapshotOrdersHistory = await userCollectionRefOrdersHistory.get();
          for (QueryDocumentSnapshot doc in userSubcollectionSnapshotPaymentHistory.docs) {
            await userCollectionRefPaymentHistory.doc(doc.id).delete();
          }
          for (QueryDocumentSnapshot doc in userSubcollectionSnapshotOrdersHistory.docs) {
            await userCollectionRefOrdersHistory.doc(doc.id).delete();
          }
          await firebaseAuth.currentUser?.delete();
        });

      } catch (e) {
        print('Kullanıcı hesabı silinirken bir hata oluştu: $e');
      }
    }
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