import 'package:flutter/material.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';
import 'package:musmeramedya/ui/add_balance/model/payment_model/payment_model.dart';
import 'package:musmeramedya/ui/add_balance/viewModel/add_balance_page_view_model.dart';


class AcceptPayDialog extends StatelessWidget {
  const AcceptPayDialog({super.key, required this.paymentModel, required this.addBalancePageViewModel});

  final AddBalancePageViewModel addBalancePageViewModel;
  final PaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ödemeyi Onayla'),
      content: Text('Ödemeyi Yaptıysanız Evet seçeneğini seçin'),
      actions: [
        TextButton(onPressed:(){
          addBalancePageViewModel.savePaymentProccessToFirebase(paymentModel);
          addBalancePageViewModel.navigation.navigateToPageClear(path: NavigationConstants.PAYMENT_SUCCESSFUL);
        }, child: Text('Evet')),
        TextButton(onPressed:() => Navigator.of(context).pop(), child: Text('Hayır')),
      ],
    );
  }
}
