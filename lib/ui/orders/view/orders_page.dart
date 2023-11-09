import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import '../../_widgets/drawer/navigation_drawer.dart';
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
        return Card(
          child: ListView.builder(
            itemCount: store.pendingOrders.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                decoration:  BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(7))
                ),
                duration: const Duration(milliseconds: 200),
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
                          buildOrdersDetail(title: 'Durum: ',value: store.pendingOrders[index].status ? 'Tamamlandı' : 'Bekleniyor',isStatusValue: store.pendingOrders[index].status),
                        ],
                      ),
                    ): Text(store.pendingOrders[index].serviceName),
                    leading: ImageIcon(AssetImage(store.pendingOrders[index].socialMediaName.toPNG)),
                    trailing: Icon(store.pendingOrders[index].status ? Icons.done : Icons.access_time_outlined,color: store.pendingOrders[index].status ? Colors.green : Colors.blueGrey,),
                  )
                ),
              );
            },
          ),
        );
      },
    );
  }

  Padding buildOrdersDetail({required String title,required String value,bool? isStatusValue}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
                          children: [
                            Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
                            Text(value,style: TextStyle(
                              color: isStatusValue == null ? Colors.black : ((isStatusValue) ? Colors.green : Colors.red)
                            ),),
                          ],
                        ),
    );
  }
}
