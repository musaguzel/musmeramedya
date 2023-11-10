// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  late final _$updatePasswordProcessIsLoadingAtom = Atom(
      name: '_SettingsViewModelBase.updatePasswordProcessIsLoading',
      context: context);

  @override
  bool get updatePasswordProcessIsLoading {
    _$updatePasswordProcessIsLoadingAtom.reportRead();
    return super.updatePasswordProcessIsLoading;
  }

  @override
  set updatePasswordProcessIsLoading(bool value) {
    _$updatePasswordProcessIsLoadingAtom
        .reportWrite(value, super.updatePasswordProcessIsLoading, () {
      super.updatePasswordProcessIsLoading = value;
    });
  }

  late final _$emailVerifiedAtom =
      Atom(name: '_SettingsViewModelBase.emailVerified', context: context);

  @override
  bool? get emailVerified {
    _$emailVerifiedAtom.reportRead();
    return super.emailVerified;
  }

  @override
  set emailVerified(bool? value) {
    _$emailVerifiedAtom.reportWrite(value, super.emailVerified, () {
      super.emailVerified = value;
    });
  }

  late final _$canResendEmailAtom =
      Atom(name: '_SettingsViewModelBase.canResendEmail', context: context);

  @override
  bool get canResendEmail {
    _$canResendEmailAtom.reportRead();
    return super.canResendEmail;
  }

  @override
  set canResendEmail(bool value) {
    _$canResendEmailAtom.reportWrite(value, super.canResendEmail, () {
      super.canResendEmail = value;
    });
  }

  late final _$updatePasswordAsyncAction =
      AsyncAction('_SettingsViewModelBase.updatePassword', context: context);

  @override
  Future<void> updatePassword(String email) {
    return _$updatePasswordAsyncAction.run(() => super.updatePassword(email));
  }

  late final _$deleteAccountAsyncAction =
      AsyncAction('_SettingsViewModelBase.deleteAccount', context: context);

  @override
  Future<void> deleteAccount() {
    return _$deleteAccountAsyncAction.run(() => super.deleteAccount());
  }

  late final _$getIsVerifiedAsyncAction =
      AsyncAction('_SettingsViewModelBase.getIsVerified', context: context);

  @override
  Future<void> getIsVerified() {
    return _$getIsVerifiedAsyncAction.run(() => super.getIsVerified());
  }

  late final _$sendVerificationEmailAsyncAction = AsyncAction(
      '_SettingsViewModelBase.sendVerificationEmail',
      context: context);

  @override
  Future<void> sendVerificationEmail() {
    return _$sendVerificationEmailAsyncAction
        .run(() => super.sendVerificationEmail());
  }

  late final _$deleteInviteCodesAsyncAction =
      AsyncAction('_SettingsViewModelBase.deleteInviteCodes', context: context);

  @override
  Future<void> deleteInviteCodes() {
    return _$deleteInviteCodesAsyncAction.run(() => super.deleteInviteCodes());
  }

  @override
  String toString() {
    return '''
updatePasswordProcessIsLoading: ${updatePasswordProcessIsLoading},
emailVerified: ${emailVerified},
canResendEmail: ${canResendEmail}
    ''';
  }
}
