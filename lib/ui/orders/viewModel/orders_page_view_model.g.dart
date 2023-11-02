// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersPageViewModel on _OrdersPageViewModelBase, Store {
  late final _$pendingOrdersAtom =
      Atom(name: '_OrdersPageViewModelBase.pendingOrders', context: context);

  @override
  ObservableList<OrdersModel> get pendingOrders {
    _$pendingOrdersAtom.reportRead();
    return super.pendingOrders;
  }

  @override
  set pendingOrders(ObservableList<OrdersModel> value) {
    _$pendingOrdersAtom.reportWrite(value, super.pendingOrders, () {
      super.pendingOrders = value;
    });
  }

  late final _$pendingOrdersLoadingAtom = Atom(
      name: '_OrdersPageViewModelBase.pendingOrdersLoading', context: context);

  @override
  bool get pendingOrdersLoading {
    _$pendingOrdersLoadingAtom.reportRead();
    return super.pendingOrdersLoading;
  }

  @override
  set pendingOrdersLoading(bool value) {
    _$pendingOrdersLoadingAtom.reportWrite(value, super.pendingOrdersLoading,
        () {
      super.pendingOrdersLoading = value;
    });
  }

  late final _$isOpenListAtom =
      Atom(name: '_OrdersPageViewModelBase.isOpenList', context: context);

  @override
  ObservableList<bool> get isOpenList {
    _$isOpenListAtom.reportRead();
    return super.isOpenList;
  }

  @override
  set isOpenList(ObservableList<bool> value) {
    _$isOpenListAtom.reportWrite(value, super.isOpenList, () {
      super.isOpenList = value;
    });
  }

  late final _$fetchPendingOrdersAsyncAction = AsyncAction(
      '_OrdersPageViewModelBase.fetchPendingOrders',
      context: context);

  @override
  Future<void> fetchPendingOrders() {
    return _$fetchPendingOrdersAsyncAction
        .run(() => super.fetchPendingOrders());
  }

  late final _$_OrdersPageViewModelBaseActionController =
      ActionController(name: '_OrdersPageViewModelBase', context: context);

  @override
  void toggleContainer(int index) {
    final _$actionInfo = _$_OrdersPageViewModelBaseActionController.startAction(
        name: '_OrdersPageViewModelBase.toggleContainer');
    try {
      return super.toggleContainer(index);
    } finally {
      _$_OrdersPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pendingOrders: ${pendingOrders},
pendingOrdersLoading: ${pendingOrdersLoading},
isOpenList: ${isOpenList}
    ''';
  }
}
