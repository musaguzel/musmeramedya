import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:musmeramedya/ui/add_balance/model/price_packages_model.dart';
import '../../../core/base/model/base_view_model.dart';

part 'add_balance_page_view_model.g.dart';

class AddBalancePageViewModel = _AddBalancePageViewModelBase
    with _$AddBalancePageViewModel;

abstract class _AddBalancePageViewModelBase with Store, BaseViewModel {


  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    getPriceList();
  }

  @observable
  ObservableList<PricePackagesModel> prices = ObservableList<
      PricePackagesModel>.of([]);

  @observable
  String iban = '';

  @action
  void copyIban() {
    Clipboard.setData(ClipboardData(text: iban));
    showsnackbar(message: 'Metin Kopyalandı');
  }

  @observable
  bool pricesLoading = false;

  @action
  Future<void> getIban() async {
    try {
      final DocumentSnapshot documentSnapshot = await firebaseFirestore
          .collection('admin').doc('odeme_bilgileri').get();

      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        iban = data['iban'];
      }
    } catch (e) {
      print('Hata: $e');
    }
  }

  @action
    Future<void> getPriceList() async {

    try {
    pricesLoading = true;
    final QuerySnapshot documentSnapshot = await firebaseFirestore.collection('prices').get();
    if (documentSnapshot.docs.isNotEmpty) {
    documentSnapshot.docs.forEach((element) {
    prices.add(PricePackagesModel.fromJson(element.data() as Map<String, dynamic>));
    pricesLoading = false;
    });
    }
    } catch (e) {
    print('Hata: $e');
    }

    }
  }