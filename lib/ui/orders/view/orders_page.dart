import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
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
            return GestureDetector(
              onTap: () {
                store.toggleContainer(index);
                setState(() {});
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: store.isOpenList[index] ? 200 : 50,
                color: Colors.blue,
                margin: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    store.pendingOrders[index].serviceName,
                    style:  const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
