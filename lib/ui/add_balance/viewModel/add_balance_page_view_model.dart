import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:musmeramedya/ui/add_balance/model/payment_model/payment_model.dart';
import 'package:musmeramedya/ui/add_balance/model/price_model/price_packages_model.dart';
import '../../../core/base/model/base_view_model.dart';

part 'add_balance_page_view_model.g.dart';

class AddBalancePageViewModel = _AddBalancePageViewModelBase
    with _$AddBalancePageViewModel;

abstract class _AddBalancePageViewModelBase with Store, BaseViewModel {


  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    await getPaymentInfo();
    await getPaymentHistory();
  }





  @action
  void copyIban() {
    Clipboard.setData(ClipboardData(text: paymentMethods?.iban ?? 'Ödeme Adresi'));
    showsnackbar(message: 'Metin Kopyalandı',backgroundColor: Colors.grey);
  }

  @action
  void setContainerState() {
    containerIsOpen = !containerIsOpen;
  }

  @observable
  bool paymentInfoLoading = false;

  @observable
  bool containerIsOpen = false;

  @observable
  PaymentInfoModel? paymentMethods;

  @observable
  String? selectedPaymentMethod = "iban";

  @observable
  String? selectedPaymentTotal;

  @observable
  String? selectedBonus;

  @observable
  String? bonusPlusTotal;

  @action
  void setTotalPayment(){
    var convertedPaymentTotal = int.tryParse(selectedPaymentTotal!);
    var convertedTotalDiscount = int.tryParse(selectedBonus!);
    var calculatePrice = convertedPaymentTotal! + convertedTotalDiscount!;
    bonusPlusTotal = calculatePrice.toString();
  }

  @action
  Future<void> savePaymentProccessToFirebase(PaymentModel paymentModel) async {
  try{
    CollectionReference userPaymentCollection = firebaseFirestore.collection('users').doc(firebaseAuth.currentUser?.uid).collection('payment_history');
    await userPaymentCollection.add(paymentModel.toJson()).then((value) async {
      await userPaymentCollection.doc(value.id).update({'payment_id' : value.id});
    });
  }catch(e){

    }
  }

  @observable
  ObservableList<PaymentModel> paymentHistory = ObservableList<PaymentModel>();

  @observable
  bool isPaymentHistoryLoading = false;

  @action
  Future<void> getPaymentHistory() async {
    isPaymentHistoryLoading = true;
    var paymentHistoryFromFirestore = await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .collection('payment_history')
        .orderBy('date', descending: true)
        .get();

    if (paymentHistoryFromFirestore.docs.isNotEmpty) {
      for (var element in paymentHistoryFromFirestore.docs) {
        paymentHistory.add(PaymentModel.fromJson(element.data()));
      }
    } else {
      print('Belge bulunamadı');
    }
    isPaymentHistoryLoading = false;
  }

  @action
  Future<void> getPaymentInfo() async {
    try {
      paymentInfoLoading = true;
      final DocumentSnapshot documentSnapshot = await firebaseFirestore
          .collection('admin').doc('odeme_bilgileri').get();

      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        paymentMethods = PaymentInfoModel.fromJson(data);
        /*var paymentMethodsDynamic = data['payment_method'] as List<dynamic>;
        paymentMethods = paymentMethodsDynamic.map((value) => value.toString()).toList();*/
        //iban = data['iban'] as String;
        paymentInfoLoading = false;
      }
    } catch (e) {
      print('Hata: $e');
    }
  }
}

