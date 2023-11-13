// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordPageViewModel on _ForgotPasswordPageViewModelBase, Store {
  late final _$emailIsValidateAtom = Atom(
      name: '_ForgotPasswordPageViewModelBase.emailIsValidate',
      context: context);

  @override
  bool get emailIsValidate {
    _$emailIsValidateAtom.reportRead();
    return super.emailIsValidate;
  }

  @override
  set emailIsValidate(bool value) {
    _$emailIsValidateAtom.reportWrite(value, super.emailIsValidate, () {
      super.emailIsValidate = value;
    });
  }

  late final _$sendVeryfyEmailAsyncAction = AsyncAction(
      '_ForgotPasswordPageViewModelBase.sendVeryfyEmail',
      context: context);

  @override
  Future<void> sendVeryfyEmail(TextEditingController emailController) {
    return _$sendVeryfyEmailAsyncAction
        .run(() => super.sendVeryfyEmail(emailController));
  }

  @override
  String toString() {
    return '''
emailIsValidate: ${emailIsValidate}
    ''';
  }
}
