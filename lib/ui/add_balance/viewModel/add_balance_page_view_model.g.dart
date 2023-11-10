// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_balance_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddBalancePageViewModel on _AddBalancePageViewModelBase, Store {
  late final _$paymentInfoLoadingAtom = Atom(
      name: '_AddBalancePageViewModelBase.paymentInfoLoading',
      context: context);

  @override
  bool get paymentInfoLoading {
    _$paymentInfoLoadingAtom.reportRead();
    return super.paymentInfoLoading;
  }

  @override
  set paymentInfoLoading(bool value) {
    _$paymentInfoLoadingAtom.reportWrite(value, super.paymentInfoLoading, () {
      super.paymentInfoLoading = value;
    });
  }

  late final _$containerIsOpenAtom = Atom(
      name: '_AddBalancePageViewModelBase.containerIsOpen', context: context);

  @override
  bool get containerIsOpen {
    _$containerIsOpenAtom.reportRead();
    return super.containerIsOpen;
  }

  @override
  set containerIsOpen(bool value) {
    _$containerIsOpenAtom.reportWrite(value, super.containerIsOpen, () {
      super.containerIsOpen = value;
    });
  }

  late final _$paymentMethodsAtom = Atom(
      name: '_AddBalancePageViewModelBase.paymentMethods', context: context);

  @override
  PaymentInfoModel? get paymentMethods {
    _$paymentMethodsAtom.reportRead();
    return super.paymentMethods;
  }

  @override
  set paymentMethods(PaymentInfoModel? value) {
    _$paymentMethodsAtom.reportWrite(value, super.paymentMethods, () {
      super.paymentMethods = value;
    });
  }

  late final _$selectedPaymentMethodAtom = Atom(
      name: '_AddBalancePageViewModelBase.selectedPaymentMethod',
      context: context);

  @override
  String? get selectedPaymentMethod {
    _$selectedPaymentMethodAtom.reportRead();
    return super.selectedPaymentMethod;
  }

  @override
  set selectedPaymentMethod(String? value) {
    _$selectedPaymentMethodAtom.reportWrite(value, super.selectedPaymentMethod,
        () {
      super.selectedPaymentMethod = value;
    });
  }

  late final _$selectedPaymentTotalAtom = Atom(
      name: '_AddBalancePageViewModelBase.selectedPaymentTotal',
      context: context);

  @override
  String? get selectedPaymentTotal {
    _$selectedPaymentTotalAtom.reportRead();
    return super.selectedPaymentTotal;
  }

  @override
  set selectedPaymentTotal(String? value) {
    _$selectedPaymentTotalAtom.reportWrite(value, super.selectedPaymentTotal,
        () {
      super.selectedPaymentTotal = value;
    });
  }

  late final _$selectedBonusAtom = Atom(
      name: '_AddBalancePageViewModelBase.selectedBonus', context: context);

  @override
  String? get selectedBonus {
    _$selectedBonusAtom.reportRead();
    return super.selectedBonus;
  }

  @override
  set selectedBonus(String? value) {
    _$selectedBonusAtom.reportWrite(value, super.selectedBonus, () {
      super.selectedBonus = value;
    });
  }

  late final _$bonusPlusTotalAtom = Atom(
      name: '_AddBalancePageViewModelBase.bonusPlusTotal', context: context);

  @override
  String? get bonusPlusTotal {
    _$bonusPlusTotalAtom.reportRead();
    return super.bonusPlusTotal;
  }

  @override
  set bonusPlusTotal(String? value) {
    _$bonusPlusTotalAtom.reportWrite(value, super.bonusPlusTotal, () {
      super.bonusPlusTotal = value;
    });
  }

  late final _$paymentHistoryAtom = Atom(
      name: '_AddBalancePageViewModelBase.paymentHistory', context: context);

  @override
  ObservableList<PaymentModel> get paymentHistory {
    _$paymentHistoryAtom.reportRead();
    return super.paymentHistory;
  }

  @override
  set paymentHistory(ObservableList<PaymentModel> value) {
    _$paymentHistoryAtom.reportWrite(value, super.paymentHistory, () {
      super.paymentHistory = value;
    });
  }

  late final _$isPaymentHistoryLoadingAtom = Atom(
      name: '_AddBalancePageViewModelBase.isPaymentHistoryLoading',
      context: context);

  @override
  bool get isPaymentHistoryLoading {
    _$isPaymentHistoryLoadingAtom.reportRead();
    return super.isPaymentHistoryLoading;
  }

  @override
  set isPaymentHistoryLoading(bool value) {
    _$isPaymentHistoryLoadingAtom
        .reportWrite(value, super.isPaymentHistoryLoading, () {
      super.isPaymentHistoryLoading = value;
    });
  }

  late final _$savePaymentProccessToFirebaseAsyncAction = AsyncAction(
      '_AddBalancePageViewModelBase.savePaymentProccessToFirebase',
      context: context);

  @override
  Future<void> savePaymentProccessToFirebase(PaymentModel paymentModel) {
    return _$savePaymentProccessToFirebaseAsyncAction
        .run(() => super.savePaymentProccessToFirebase(paymentModel));
  }

  late final _$getPaymentHistoryAsyncAction = AsyncAction(
      '_AddBalancePageViewModelBase.getPaymentHistory',
      context: context);

  @override
  Future<void> getPaymentHistory() {
    return _$getPaymentHistoryAsyncAction.run(() => super.getPaymentHistory());
  }

  late final _$getPaymentInfoAsyncAction = AsyncAction(
      '_AddBalancePageViewModelBase.getPaymentInfo',
      context: context);

  @override
  Future<void> getPaymentInfo() {
    return _$getPaymentInfoAsyncAction.run(() => super.getPaymentInfo());
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
  void setContainerState() {
    final _$actionInfo = _$_AddBalancePageViewModelBaseActionController
        .startAction(name: '_AddBalancePageViewModelBase.setContainerState');
    try {
      return super.setContainerState();
    } finally {
      _$_AddBalancePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalPayment() {
    final _$actionInfo = _$_AddBalancePageViewModelBaseActionController
        .startAction(name: '_AddBalancePageViewModelBase.setTotalPayment');
    try {
      return super.setTotalPayment();
    } finally {
      _$_AddBalancePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paymentInfoLoading: ${paymentInfoLoading},
containerIsOpen: ${containerIsOpen},
paymentMethods: ${paymentMethods},
selectedPaymentMethod: ${selectedPaymentMethod},
selectedPaymentTotal: ${selectedPaymentTotal},
selectedBonus: ${selectedBonus},
bonusPlusTotal: ${bonusPlusTotal},
paymentHistory: ${paymentHistory},
isPaymentHistoryLoading: ${isPaymentHistoryLoading}
    ''';
  }
}
