// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_balance_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddBalancePageViewModel on _AddBalancePageViewModelBase, Store {
  late final _$pricesAtom =
      Atom(name: '_AddBalancePageViewModelBase.prices', context: context);

  @override
  ObservableList<PricePackagesModel> get prices {
    _$pricesAtom.reportRead();
    return super.prices;
  }

  @override
  set prices(ObservableList<PricePackagesModel> value) {
    _$pricesAtom.reportWrite(value, super.prices, () {
      super.prices = value;
    });
  }

  late final _$ibanAtom =
      Atom(name: '_AddBalancePageViewModelBase.iban', context: context);

  @override
  String get iban {
    _$ibanAtom.reportRead();
    return super.iban;
  }

  @override
  set iban(String value) {
    _$ibanAtom.reportWrite(value, super.iban, () {
      super.iban = value;
    });
  }

  late final _$pricesLoadingAtom = Atom(
      name: '_AddBalancePageViewModelBase.pricesLoading', context: context);

  @override
  bool get pricesLoading {
    _$pricesLoadingAtom.reportRead();
    return super.pricesLoading;
  }

  @override
  set pricesLoading(bool value) {
    _$pricesLoadingAtom.reportWrite(value, super.pricesLoading, () {
      super.pricesLoading = value;
    });
  }

  late final _$getIbanAsyncAction =
      AsyncAction('_AddBalancePageViewModelBase.getIban', context: context);

  @override
  Future<void> getIban() {
    return _$getIbanAsyncAction.run(() => super.getIban());
  }

  late final _$getPriceListAsyncAction = AsyncAction(
      '_AddBalancePageViewModelBase.getPriceList',
      context: context);

  @override
  Future<void> getPriceList() {
    return _$getPriceListAsyncAction.run(() => super.getPriceList());
  }

  late final _$_AddBalancePageViewModelBaseActionController =
      ActionController(name: '_AddBalancePageViewModelBase', context: context);

  @override
  void copyIban() {
    final _$actionInfo = _$_AddBalancePageViewModelBaseActionController
        .startAction(name: '_AddBalancePageViewModelBase.copyIban');
    try {
      return super.copyIban();
    } finally {
      _$_AddBalancePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
prices: ${prices},
iban: ${iban},
pricesLoading: ${pricesLoading}
    ''';
  }
}
