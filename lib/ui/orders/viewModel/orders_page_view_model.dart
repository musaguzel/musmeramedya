import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:musmeramedya/ui/orders/model/orders_model.dart';

import '../../../core/base/model/base_view_model.dart';
part 'orders_page_view_model.g.dart';

class OrdersPageViewModel = _OrdersPageViewModelBase with _$OrdersPageViewModel;

abstract class _OrdersPageViewModelBase with Store, BaseViewModel {

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    await fetchPendingOrders().then((value) => isOpenList = List.generate(pendingOrders.length, (index) => false).asObservable());
  }

  @observable
  ObservableList<OrdersModel> pendingOrders = ObservableList<OrdersModel>();

  @observable
  bool pendingOrdersLoading = true;

  @observable
  ObservableList<bool> isOpenList = ObservableList<bool>();

  @action
  void toggleContainer(int index) {
      isOpenList[index] = !isOpenList[index];
  }

  @action
  Future<void> fetchPendingOrders() async {
    if(firebaseAuth.currentUser != null){
      QuerySnapshot pendingTradeSnapshot=
      await firebaseFirestore.collection("users").doc(firebaseAuth.currentUser?.uid).collection('orders_history').get();
      if (pendingTradeSnapshot.docs.isNotEmpty) {
        pendingTradeSnapshot.docs.forEach((element) {
          pendingOrders.add(OrdersModel.fromJson(element.data() as Map<String, dynamic>));
          pendingOrdersLoading = false;
        });
    }
    } else {
      print('Belge bulunamadı');
    }
  }
}