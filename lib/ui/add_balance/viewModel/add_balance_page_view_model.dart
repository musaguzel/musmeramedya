import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/model/base_view_model.dart';
part 'add_balance_page_view_model.g.dart';

class AddBalancePageViewModel = _AddBalancePageViewModelBase with _$AddBalancePageViewModel;

abstract class _AddBalancePageViewModelBase with Store, BaseViewModel {

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    getPriceList();
  }
  @observable
  ObservableList<String> prices = ObservableList<String>.of([]);
  @action
  Future<void> getPriceList() async {

    try {
      final DocumentSnapshot document = await firebaseFirestore.collection('admin').doc('pricelist').get();
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;

      for (int i = 1; i <= data.length; i++) {
        prices.add(data['$i.fiyat'] as String);
      }
    } catch (e) {
      print('Hata: $e');
    }

  }
}