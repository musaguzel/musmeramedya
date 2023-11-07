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

  late final _$selectedDiscountAtom = Atom(
      name: '_AddBalancePageViewModelBase.selectedDiscount', context: context);

  @override
  String? get selectedDiscount {
    _$selectedDiscountAtom.reportRead();
    return super.selectedDiscount;
  }

  @override
  set selectedDiscount(String? value) {
    _$selectedDiscountAtom.reportWrite(value, super.selectedDiscount, () {
      super.selectedDiscount = value;
    });
  }

  late final _$totalPaymentAtom =
      Atom(name: '_AddBalancePageViewModelBase.totalPayment', context: context);

  @override
  String? get totalPayment {
    _$totalPaymentAtom.reportRead();
    return super.totalPayment;
  }

  @override
  set totalPayment(String? value) {
    _$totalPaymentAtom.reportWrite(value, super.totalPayment, () {
      super.totalPayment = value;
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
selectedDiscount: ${selectedDiscount},
totalPayment: ${totalPayment}
    ''';
  }
}
