// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageViewModel on _LoginPageViewModelBase, Store {
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

  @override
  String toString() {
    return '''
isFocusedNodeEmail: ${isFocusedNodeEmail},
isFocusedNodePassword: ${isFocusedNodePassword}
    ''';
  }
}
