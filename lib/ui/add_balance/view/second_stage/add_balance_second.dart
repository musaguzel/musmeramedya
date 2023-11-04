import 'package:flutter/material.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/ui/add_balance/viewModel/add_balance_page_view_model.dart';


class AddBalanceSecondStage extends StatelessWidget {
  const AddBalanceSecondStage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedPrice = ModalRoute.of(context)?.settings.arguments;
    return BaseView(viewModel: AddBalancePageViewModel(),
      onModelReady: (model){

      },
        onPageBuilder: (context,store,networkResult) => Scaffold(body: Center(child: Text(selectedPrice.toString()),),),
      );
  }
}
