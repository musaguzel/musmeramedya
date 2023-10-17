// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterPageViewModel on _RegisterPageViewModelBase, Store {
  late final _$emailValidateAtom =
      Atom(name: '_RegisterPageViewModelBase.emailValidate', context: context);

  @override
  bool get emailValidate {
    _$emailValidateAtom.reportRead();
    return super.emailValidate;
  }

  @override
  set emailValidate(bool value) {
    _$emailValidateAtom.reportWrite(value, super.emailValidate, () {
      super.emailValidate = value;
    });
  }

  late final _$isLockAtom =
      Atom(name: '_RegisterPageViewModelBase.isLock', context: context);

  @override
  bool get isLock {
    _$isLockAtom.reportRead();
    return super.isLock;
  }

  @override
  set isLock(bool value) {
    _$isLockAtom.reportWrite(value, super.isLock, () {
      super.isLock = value;
    });
  }

  late final _$createUserWithEmailAndPasswordAsyncAction = AsyncAction(
      '_RegisterPageViewModelBase.createUserWithEmailAndPassword',
      context: context);

  @override
  Future<void> createUserWithEmailAndPassword(BuildContext context) {
    return _$createUserWithEmailAndPasswordAsyncAction
        .run(() => super.createUserWithEmailAndPassword(context));
  }

  late final _$_RegisterPageViewModelBaseActionController =
      ActionController(name: '_RegisterPageViewModelBase', context: context);

  @override
  void isLockStateChange() {
    final _$actionInfo = _$_RegisterPageViewModelBaseActionController
        .startAction(name: '_RegisterPageViewModelBase.isLockStateChange');
    try {
      return super.isLockStateChange();
    } finally {
      _$_RegisterPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailValidate: ${emailValidate},
isLock: ${isLock}
    ''';
  }
}
