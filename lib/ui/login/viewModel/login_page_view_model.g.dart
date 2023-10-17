// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageViewModel on _LoginPageViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_LoginPageViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLockOpenAtom =
      Atom(name: '_LoginPageViewModelBase.isLockOpen', context: context);

  @override
  bool get isLockOpen {
    _$isLockOpenAtom.reportRead();
    return super.isLockOpen;
  }

  @override
  set isLockOpen(bool value) {
    _$isLockOpenAtom.reportWrite(value, super.isLockOpen, () {
      super.isLockOpen = value;
    });
  }

  late final _$isFocusedNodeEmailAtom = Atom(
      name: '_LoginPageViewModelBase.isFocusedNodeEmail', context: context);

  @override
  bool get isFocusedNodeEmail {
    _$isFocusedNodeEmailAtom.reportRead();
    return super.isFocusedNodeEmail;
  }

  @override
  set isFocusedNodeEmail(bool value) {
    _$isFocusedNodeEmailAtom.reportWrite(value, super.isFocusedNodeEmail, () {
      super.isFocusedNodeEmail = value;
    });
  }

  late final _$isFocusedNodePasswordAtom = Atom(
      name: '_LoginPageViewModelBase.isFocusedNodePassword', context: context);

  @override
  bool get isFocusedNodePassword {
    _$isFocusedNodePasswordAtom.reportRead();
    return super.isFocusedNodePassword;
  }

  @override
  set isFocusedNodePassword(bool value) {
    _$isFocusedNodePasswordAtom.reportWrite(value, super.isFocusedNodePassword,
        () {
      super.isFocusedNodePassword = value;
    });
  }

  late final _$loginWithEmailAndPasswordAsyncAction = AsyncAction(
      '_LoginPageViewModelBase.loginWithEmailAndPassword',
      context: context);

  @override
  Future<void> loginWithEmailAndPassword(BuildContext context) {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword(context));
  }

  late final _$_LoginPageViewModelBaseActionController =
      ActionController(name: '_LoginPageViewModelBase', context: context);

  @override
  void isLockStateChange() {
    final _$actionInfo = _$_LoginPageViewModelBaseActionController.startAction(
        name: '_LoginPageViewModelBase.isLockStateChange');
    try {
      return super.isLockStateChange();
    } finally {
      _$_LoginPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLockOpen: ${isLockOpen},
isFocusedNodeEmail: ${isFocusedNodeEmail},
isFocusedNodePassword: ${isFocusedNodePassword}
    ''';
  }
}
