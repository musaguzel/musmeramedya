import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';
import 'package:musmeramedya/ui/add_balance/viewModel/add_balance_page_view_model.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import 'package:musmeramedya/ui/register/model/user_model.dart';
import '../../../../core/init/network/network_change_manager.dart';
import '../../../../product/helper/responsive.dart';
import '../../../_widgets/drawer/navigation_drawer.dart';
import '../../components/payment_history_data_table.dart';
import '../../model/payment_model/payment_model.dart';

class AddBalancePage extends StatelessWidget {
  const AddBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: AddBalancePageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, store, networkResult) =>
            Scaffold(
              drawer: NavigationDrawerMain(),
                appBar: AppBar(
                  title: const Text('Bakiye Ekle'),
                ),
                body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
                    child: Center(
                      child: SizedBox(
                        width: Responsive.isDesktop(context)
                            ? context.width / 2
                            : null,
                        child: Column(
                            children: [
                          Card(
                              margin: Responsive.isMobile(context) ? const EdgeInsets.all(5) : const EdgeInsets.only(top: 40),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        buildTitle('Yöntem'),
                                        buildDropdownPaymentMethod(
                                            store: store, context: context),
                                        buildSizedBox20,
                                        buildTitle('Tutar'),
                                        buildDropdownPaymentTotal(
                                            store: store, context: context),
                                        buildSizedBox20,
                                        buildButtonNext(context,store,userModelGlobal),
                                        buildSizedBox20,
                                      ]))),

                                    Observer(builder: (_){
                                      return
                                      !store.isPaymentHistoryLoading ?
                                       Padding(
                                         padding: Responsive.isMobile(context) ? const EdgeInsets.all(5) : const EdgeInsets.only(top: 30),
                                         child: PaymentHistoryDataTable(paymentHistory: store.paymentHistory,),
                                       ) : const CircularProgressIndicator();
                                    },)


                        ]),
                      ),
                    ))));
  }

  Observer buildButtonNext(BuildContext context,AddBalancePageViewModel store,UserModel currentUser) {
    return Observer(builder: (_) {
      return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(context.width, 43)),
        ),
        onPressed: () {
          if (store.selectedPaymentMethod != null &&
              store.selectedPaymentTotal != null) {
            final formattedDate = DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now());
            final paymentModel = PaymentModel(userId: currentUser.userID.toString(),userName: currentUser.fullName.toString(),selectedPaymentMethod: store.selectedPaymentMethod.toString()
            ,selectedPaymentTotal:store.selectedPaymentTotal.toString(),selectedPaymentBonus: store.selectedBonus.toString(),bonusPlusTotal: store.bonusPlusTotal.toString(),isCancelled: false,date: formattedDate,friendsReferenceCode: currentUser.friendsReferenceCode.toString(),status: false,);
            store.navigation.navigateToPage(
                path: NavigationConstants.ADD_BALANCE_SECOND, data: paymentModel);
          } else {
            store.showsnackbar(message: 'Lütfen Gerekli Alanları Doldurun');
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('İlerle'),
            Icon(
              Icons.arrow_circle_right_outlined,
            )
          ],
        ),
      );
    });
  }

  SizedBox get buildSizedBox20 {
    return const SizedBox(
      height: 20,
    );
  }

  Padding buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, bottom: 8.0, top: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Observer buildDropdownPaymentMethod(
      {required AddBalancePageViewModel store, required BuildContext context}) {
    return Observer(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Arka plan rengi beyaz
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            padding: context.paddingNormal,
            value: store.selectedPaymentMethod,
            hint: Text(
              store.paymentMethods?.paymentMethod.join(" - ") ??
                  'ödeme yöntemi',
              style: const TextStyle(color: Colors.black),
            ),
            items: store.paymentMethods?.paymentMethod
                .map((String value) =>
                DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                .toList(),
            onChanged: (value) => store.selectedPaymentMethod = value,
            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.blueGrey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    });
  }

  Observer buildDropdownPaymentTotal(
      {required AddBalancePageViewModel store, required BuildContext context}) {
    return Observer(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Arka plan rengi beyaz
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            padding: context.paddingNormal,
            value: store.selectedPaymentTotal,
            hint: Text(
              store.paymentMethods?.prices.join(" - ") ?? 'ödeme yöntemi',
              style: const TextStyle(color: Colors.black),
            ),
            items: store.paymentMethods?.prices
                .map((String value) =>
                DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                .toList(),
            onChanged: (value){
              store.selectedPaymentTotal = value;
              int? index = store.paymentMethods?.prices.indexOf(value ?? "100" );
              store.selectedBonus = store.paymentMethods?.discounts[index ?? 0];
              store.setTotalPayment();
            },
            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.blueGrey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    });
  }
}
