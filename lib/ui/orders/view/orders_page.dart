import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import '../../main/components/navigation_drawer.dart';
import '../viewModel/orders_page_view_model.dart';



class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: OrdersPageViewModel(), onModelReady: (model){
      model.setContext(context);
      model.init();
    },onPageBuilder: (context,store,networkResult) => Scaffold(
      appBar: AppBar(title: const Text("Siparişler"),),
      drawer: NavigationDrawerMain(),
      body: buildObserver(store),
    ));
  }

  Observer buildObserver(OrdersPageViewModel store) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: store.pendingOrders.length,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              duration: const Duration(milliseconds: 500),
              height: store.isOpenList[index] ? 200 : 50,
              margin: const EdgeInsets.all(8),
              child: Center(
                child: ListTile(
                  onTap: (){
                    store.toggleContainer(index);
                    setState(() {});
                  },
                  title: store.isOpenList[index] ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildOrdersDetail(title: 'Tarih: ',value: store.pendingOrders[index].datetime.toString()),
                        buildOrdersDetail(title: 'Link: ',value: store.pendingOrders[index].socialMediaLink),
                        buildOrdersDetail(title: 'Fiyat: ',value: store.pendingOrders[index].servicePrice),
                        buildOrdersDetail(title: 'Miktar: ',value: store.pendingOrders[index].serviceAmount),
                        buildOrdersDetail(title: 'Servis: ',value: store.pendingOrders[index].serviceName),
                        buildOrdersDetail(title: 'Durum: ',value: store.pendingOrders[index].status.toString()),
                      ],
                    ),
                  ): Text(store.pendingOrders[index].serviceName),
                  leading: ImageIcon(AssetImage(store.pendingOrders[index].socialMediaName.toPNG)),

                )
              ),
            );
          },
        );
      },
    );
  }

  Row buildOrdersDetail({required String title,required String value}) {
    return Row(
                        children: [
                          Text(title),
                          Text(value),
                        ],
                      );
  }
}
