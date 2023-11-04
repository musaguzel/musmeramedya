import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';
import 'package:musmeramedya/ui/add_balance/view/second_stage/add_balance_second.dart';
import 'package:musmeramedya/ui/add_balance/viewModel/add_balance_page_view_model.dart';
import 'package:musmeramedya/ui/main/components/navigation_drawer.dart';


class AddBalancePage extends StatelessWidget {
  const AddBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: AddBalancePageViewModel(), onModelReady: (model){
      model.setContext(context);
      model.init();
    }, onPageBuilder: (context,store,networkResult) => Scaffold(
      //drawer: NavigationDrawerMain(),
      appBar: AppBar(title: Text('Bakiye Ekle'),),
        body: Center(
          child: Observer(
            builder: (_){
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: context.width / 2.74, // Kartların maksimum genişliği
                  crossAxisSpacing: 10,    // Yatayda aralık
                  mainAxisSpacing: 10,     // Dikeyde aralık
                ),
                itemCount: store.prices.length, // 3 sıra x 3 sütun kart oluşturacak
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                        store.navigation.navigateToPage(path: NavigationConstants.ADD_BALANCE_SECOND,data: store.prices[index]);
                    },
                    child: Card(
                      color: Colors.blueGrey,
                      child: Center(
                        child: Text(
                          store.prices[index],
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        )
    ));
  }

}
