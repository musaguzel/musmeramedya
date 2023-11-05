import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/add_balance/model/price_packages_model.dart';
import 'package:musmeramedya/ui/add_balance/viewModel/add_balance_page_view_model.dart';

import '../../../../core/components/Animation/Fade_Animation.dart';
import '../../components/accept_pay_dialog.dart';

class AddBalanceSecondStage extends StatelessWidget {
  const AddBalanceSecondStage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedPrice =
        ModalRoute.of(context)?.settings.arguments as PricePackagesModel;
    return BaseView(
      viewModel: AddBalancePageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.getIban();
      },
      onPageBuilder: (context, store, networkResult) => Scaffold(
          appBar: AppBar(
            title: const Text('Bakiye Ekle'),
          ),
          body: Card(
            margin: context.paddingNormal,
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text( 'Ödenecek Tutar: ',style: TextStyle(fontSize: 20),),
                      Text( selectedPrice.price,style: const TextStyle(fontSize: 20),),
                      const Icon(Icons.currency_bitcoin,size: 20,),

                    ],
                  ),
                  const SizedBox(height: 40,),
                  const Text('Gönderici açıklama kısmına İsim Soyisim yazmanız gerekmektedir\n\nÖdeme Adresi',style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center),
                  Observer(builder: (_){
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        store.iban.isNotEmpty ? store.iban : 'Ödeme adresi',
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    );
                  }),
                  Observer(
                    builder: (_){
                      return ElevatedButton(
                        onPressed: store.copyIban,
                        child: const Text('Kopyala'),
                      );
                    },
                  ),
                  Spacer(),
                  Observer(
                    builder: (_){
                      return ElevatedButton(
                        onPressed: ()=>  showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => FadeAnimation(
                              delay: 0.4,
                              child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                  child: const AcceptPayDialog()),
                            )),
                        child: Text('Ödemeyi yaptım'),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
