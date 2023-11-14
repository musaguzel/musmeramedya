import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
part 'login_page_view_model.g.dart';

class LoginPageViewModel = _LoginPageViewModelBase with _$LoginPageViewModel;

abstract class _LoginPageViewModelBase with Store, BaseViewModel {

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  @override
  void init() {
    focusNodeEmail.addListener(() {
      isFocusedNodeEmail = focusNodeEmail.hasFocus;
    });
    focusNodePassword.addListener(() {
      isFocusedNodePassword = focusNodePassword.hasFocus;
    });
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @action
  Future<void> loginWithEmailAndPassword(BuildContext context) async {
    showDialog(context: viewModelContext, barrierDismissible: false,builder: (context) => const Center(child: CircularProgressIndicator(),));
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim()).then((value) =>navigation.navigateToPageClear(path: NavigationConstants.MAIN));
    }catch(error){
      if (error is FirebaseAuthException) {
        switch(error.code){
          case 'invalid-email': showsnackbar(message: "Geçersiz Email",backgroundColor: Colors.blueGrey);break;
          case 'user-not-found': showsnackbar(message: "Kullanıcı Bulunamadı",backgroundColor: Colors.blueGrey);break;
          case 'network-request-failed': showsnackbar(message: "Bağlantı Hatası",backgroundColor: Colors.blueGrey);break;
          case 'too-many-requests': showsnackbar(message: "Çok Fazla İstekte Bulundunuz",backgroundColor: Colors.blueGrey);break;
          case 'wrong-password': showsnackbar(message: "Yanlış Şifre",backgroundColor: Colors.blueGrey); break;

        }

      }
      Navigator.of(viewModelContext).pop();
    }
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = true;

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }


  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
   @observable
   bool isFocusedNodeEmail = false;
  @observable
  bool isFocusedNodePassword = false;


}
