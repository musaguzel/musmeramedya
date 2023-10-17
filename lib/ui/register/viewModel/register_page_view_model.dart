import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:musmeramedya/core/constants/navigation/navigation_constants.dart';
import '../../../core/base/model/base_view_model.dart';
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
    try {
      int balance = 0;

        await firebaseAuth
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
            .then((value) async {


          UserModel users = UserModel(
            fullName: fullNameController.text,
            email: emailController.text,
            balance: balance,
            userID: firebaseAuth.currentUser?.uid,);

          await firebaseFirestore
              .collection("users")
              .doc(firebaseAuth.currentUser?.uid)
              .set(users.toJson());

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

}
