import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
import '../model/user_model.dart';
part 'register_page_view_model.g.dart';

class RegisterPageViewModel = _RegisterPageViewModelBase with _$RegisterPageViewModel;

abstract class _RegisterPageViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void init() {

  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @action
  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    showDialog(context: viewModelContext, barrierDismissible: false,builder: (context) => const Center(child: CircularProgressIndicator(),));
    try {
      int balance = 0;

        await firebaseAuth
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
            .then((value) async {

              String referenceCode = await generateInviteCode(firebaseAuth.currentUser!.uid);

          UserModel users = UserModel(
            fullName: fullNameController.text,
            email: emailController.text,
            balance: balance,
            userID: firebaseAuth.currentUser?.uid,
          referenceCode: referenceCode);

          await firebaseFirestore
              .collection("users")
              .doc(firebaseAuth.currentUser?.uid)
              .set(users.toJson());

          await firebaseAuth.currentUser?.sendEmailVerification();

          showsnackbar(
              message: "Hesabınız Oluşturuldu", backgroundColor: Colors.green);
        });
        navigation.navigateToPage(path: NavigationConstants.MAIN);

    } catch (error) {
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'invalid-email':
            showsnackbar(message: "Geçersiz E-Mail Adresi");
            break;
          case 'network-request-failed':
            showsnackbar(message: "Bağlantı Hatası");
            break;
          case 'weak-password':
            showsnackbar(
                message:
                "Zayıf Parola");
            break; //No such user found
          case 'email-already-in-use':
            showsnackbar(message: "E-Mail zaten kullanılıyor");
            break;
        }
      }
      Navigator.of(viewModelContext).pop();
    }
  }

  @observable
  bool emailValidate = false;

  @observable
  bool isLock = true;

  @action
  void isLockStateChange() {
    isLock = !isLock;
  }


  final CollectionReference inviteCodesCollection =
  FirebaseFirestore.instance.collection('inviteCodes');




  @action
  Future<String> generateInviteCode(String userId) async {
    var random = Random();
    int codeLength = 8;
    String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    String inviteCode = '';

    do {
      inviteCode = '';
      for (int i = 0; i < codeLength; i++) {
        int index = random.nextInt(characters.length);
        inviteCode += characters[index];
      }
    } while (await isInviteCodeExists(inviteCode));

    // Üretilen kodu Firestore'a ekleyin ve kullanıcı ID'si ile ilişkilendirin.
    await inviteCodesCollection.doc(inviteCode).set({'used': true, 'userId': userId});

    return inviteCode;
  }
  @action
  Future<bool> isInviteCodeExists(String code) async {
    // Firestore'da kodun var olup olmadığını kontrol et.
    DocumentSnapshot snapshot = await inviteCodesCollection.doc(code).get();
    return snapshot.exists;
  }

}
