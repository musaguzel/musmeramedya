import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';
import 'package:musmeramedya/product/widgets/shimmer/shimmer_widget.dart';
import 'package:musmeramedya/ui/add_balance/viewModel/add_balance_page_view_model.dart';


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
              return store.prices.isNotEmpty ?  GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: context.width , // Kartların maksimum genişliği
                  mainAxisExtent: context.height / 5,
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
                      color: Colors.grey.shade500,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(store.prices[index].title,style: const TextStyle(fontSize: 24),),
                            ListTile(
                              title: Text(store.prices[index].subtitle),
                              subtitle: Text(store.prices[index].price),
                              trailing: const Icon(Icons.arrow_circle_right,size: 30,color: Colors.yellow,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ) : CircularProgressIndicator();
            },
          )
        )
    ));
  }

}
