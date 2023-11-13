import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/model/base_view_model.dart';

part 'forgot_password_page_view_model.g.dart';

class ForgotPasswordPageViewModel = _ForgotPasswordPageViewModelBase
    with _$ForgotPasswordPageViewModel;

abstract class _ForgotPasswordPageViewModelBase with Store, BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  bool emailIsValidate = false;

  @action
  Future<void> sendVeryfyEmail(TextEditingController emailController) async {
    showDialog(context: viewModelContext, barrierDismissible: false,builder: (context) => const Center(child: CircularProgressIndicator(),));
   try{
     await firebaseAuth
         .sendPasswordResetEmail(email: emailController.text.trim())
         .then((value) =>
         showsnackbar(message: 'Şifre sıfırlama bağlantısı E-mail adresinize gönderildi'));
     Navigator.of(viewModelContext).popUntil((route) => route.isFirst);
   } on FirebaseAuthException catch (e){
       switch(e.code){
         case 'user-not-found': showsnackbar(message: 'Kullanıcı Bulunamadı');break;
         case 'network-request-failed': showsnackbar(message: 'Ağ Hatası');break;
         case 'too-many-requests': showsnackbar(message: 'Çok fazla istekte bulundunuz');break;
         default:showsnackbar(message: 'Şifre sıfırlama bağlantısı gönderilemedi');
       }
      Navigator.of(viewModelContext).pop();
   }
  }
}
