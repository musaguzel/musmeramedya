import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import '../../../core/base/model/base_view_model.dart';

part 'login_page_view_model.g.dart';

class LoginPageViewModel = _LoginPageViewModelBase with _$LoginPageViewModel;

abstract class _LoginPageViewModelBase with Store, BaseViewModel {

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



  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
   @observable
   bool isFocusedNodeEmail = false;
  @observable
  bool isFocusedNodePassword = false;


}
