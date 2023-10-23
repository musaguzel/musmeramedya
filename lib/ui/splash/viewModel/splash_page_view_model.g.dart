// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashPageViewModel on _SplashPageViewModelBase, Store {
  late final _$isAppUpToDateAtom =
      Atom(name: '_SplashPageViewModelBase.isAppUpToDate', context: context);

  @override
  bool? get isAppUpToDate {
    _$isAppUpToDateAtom.reportRead();
    return super.isAppUpToDate;
  }

  @override
  set isAppUpToDate(bool? value) {
    _$isAppUpToDateAtom.reportWrite(value, super.isAppUpToDate, () {
      super.isAppUpToDate = value;
    });
  }

  late final _$fetchFirstResultAsyncAction = AsyncAction(
      '_SplashPageViewModelBase.fetchFirstResult',
      context: context);

  @override
  Future<void> fetchFirstResult() {
    return _$fetchFirstResultAsyncAction.run(() => super.fetchFirstResult());
  }

  late final _$_SplashPageViewModelBaseActionController =
      ActionController(name: '_SplashPageViewModelBase', context: context);

  @override
  void _updateView(NetworkResult result) {
    final _$actionInfo = _$_SplashPageViewModelBaseActionController.startAction(
        name: '_SplashPageViewModelBase._updateView');
    try {
      return super._updateView(result);
    } finally {
      _$_SplashPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAppUpToDate: ${isAppUpToDate}
    ''';
  }
}
