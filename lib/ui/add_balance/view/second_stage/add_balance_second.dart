import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/add_balance/model/payment_model/payment_model.dart';
import 'package:musmeramedya/ui/add_balance/model/price_model/price_packages_model.dart';
import 'package:musmeramedya/ui/add_balance/viewModel/add_balance_page_view_model.dart';

import '../../../../core/components/Animation/Fade_Animation.dart';
import '../../components/accept_pay_dialog.dart';

class AddBalanceSecondStage extends StatelessWidget {
  const AddBalanceSecondStage({super.key});

  @override
  Widget build(BuildContext context) {
    /*final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String selectedPaymentMethod =
        arguments['selected_payment_method'] ?? '';
    final String selectedPaymentTotal =
        arguments['selected_payment_total'] ?? '';
    final String selectedPaymentDiscount =
        arguments['selected_payment_discount'] ?? '';
    final String totalPayment =
        arguments['total_payment'] ?? '';
    final String userName =
        arguments['user_name'] ?? '';
    final String userID =
        arguments['user_id'] ?? '';*/
    final PaymentModel arguments =
    ModalRoute.of(context)!.settings.arguments as PaymentModel;
    return BaseView(
      viewModel: AddBalancePageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.getPaymentInfo();
      },
      onPageBuilder: (context, store, networkResult) => Scaffold(
          appBar: AppBar(
            title: const Text('Bakiye Ekle'),
          ),
          body: Card(
            margin: context.paddingNormal,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHowToMakePaymentInfoText,
                  buildPaymentInfoContainer(store),
                  const SizedBox(
                    height: 25,
                  ),
                  buildPaymentInfoSummary(context, store, arguments),
                  const Spacer(),
                  buildPaymentSuccessfulButton(context,store,arguments)
                ],
              ),
            ),
          )),
    );
  }

  FadeAnimation get buildHowToMakePaymentInfoText {
    return FadeAnimation(
                  delay: 0.7,
                  child: const Card(
                      color: Colors.blue,
                      child: ListTile(
                        title: Text('Ödeme Nasıl Yapılır'),
                        subtitle: Text('1- Toplam tutar belirtilen ödeme adresine EFT/Havale yöntemi ile gönderilir.'
                            '\n2- Ödemeyi yaptım butonuna tıklayarak işlem tamamlanır. Bakiyeniz ortalama 1-2 saat içinde hesabınıza yansır.'),
                      )
                  ),
                );
  }

  Observer buildPaymentInfoContainer(AddBalancePageViewModel store) {
    return Observer(builder: (_) {
      return FadeAnimation(
        delay: 0.7,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                  begin: Alignment.center,
                  colors: [Colors.blue.shade200, Colors.blue.shade200])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ödeme Adresi',
                        style: TextStyle(fontSize: 20.0)),
                    ElevatedButton(
                      onPressed: store.copyIban,
                      child: const Text('Kopyala'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    store.paymentMethods?.iban ?? 'Ödeme Adresi',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Observer buildPaymentInfoSummary(
      BuildContext context,
      AddBalancePageViewModel store,
      PaymentModel paymentModel) {
    return Observer(builder: (_) {
      return FadeAnimation(
        delay: 0.7,
        child: Container(
          width: context.width / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.white, Colors.white])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sipariş Özeti',
                  style: TextStyle(fontSize: 20),
                ),
                buildSummaryInfo('Yöntem', paymentModel.selectedPaymentMethod, false, false),
                buildSummaryInfo('Tutar', paymentModel.selectedPaymentTotal, false, false),
                buildSummaryInfo('İndirim\n', '-${paymentModel.selectedPaymentDiscount}\n', true, false),
                const Divider(color: Colors.grey, height: 1),
                buildSummaryInfo('Toplam Tutar', paymentModel.totalPayment, true, true),
              ],
            ),
          ),
        ),
      );
    });
  }

  Row buildSummaryInfo(
      String title, String info, bool isColoredText, bool isBigFontText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\n$title ',
          style: TextStyle(
              color: isColoredText ? Colors.blue : Colors.black,
              fontSize: isBigFontText ? 20 : 15),
        ),
        Text(
          '\n$info',
          style: TextStyle(
              color: isColoredText ? Colors.blue : Colors.black,
              fontSize: isBigFontText ? 20 : 15),
        ),
      ],
    );
  }

  Observer buildPaymentSuccessfulButton(BuildContext context,AddBalancePageViewModel store,PaymentModel paymentModel) {
    return Observer(
      builder: (_) {
        return ElevatedButton(
          onPressed: () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => FadeAnimation(
                    delay: 0.4,
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: AcceptPayDialog(addBalancePageViewModel: store,paymentModel: paymentModel,)),
                  )),
          child: const Text('Ödemeyi yaptım'),
        );
      },
    );
  }
}
/* Observer(
                              builder: (_){
                                return GestureDetector(
                                  onTap: () => store.setContainerState(),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 800),
                                    height: store.containerIsOpen ? 200 : 50,
                                    width: context.width,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.center,
                                          colors: [Colors.purple.shade100, Colors.pink.shade100])
                                    ),
                                    child: Center(child: const Text('Ödeme Nasıl Yapılır?',textAlign: TextAlign.center,)),
                                  ),
                                );
                              },
                            ),*/
