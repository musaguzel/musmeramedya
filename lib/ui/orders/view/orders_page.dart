import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import '../../../core/init/network/network_change_manager.dart';
import '../../../product/helper/responsive.dart';
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
    return BaseView(
        viewModel: OrdersPageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, store, networkResult) => Scaffold(
              appBar: AppBar(
                title: const Text("Siparişler"),
              ),
              drawer: NavigationDrawerMain(),
              body: networkResult == NetworkResult.off
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : buildObserver(context, store),
            ));
  }

  Observer buildObserver(BuildContext context, OrdersPageViewModel store) {
    return Observer(
      builder: (_) {
        return store.pendingOrdersLoading
            ? const Center(child: CircularProgressIndicator())
            : (store.pendingOrders.isNotEmpty)
                ? Center(
                  child: SizedBox(
                      width: Responsive.isDesktop(context)
                          ? context.width / 2
                          : null,
                      child: Card(
                        child: ListView.builder(
                          itemCount: store.pendingOrders.length,
                          itemBuilder: (context, index) {
                            return AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(7))),
                              duration: const Duration(milliseconds: 200),
                              height: store.isOpenList[index] ? 200 : 50,
                              margin: Responsive.isMobile(context) ? const EdgeInsets.all(8) : const EdgeInsets.only(left: 50,right: 50,top: 12),
                              child: Center(
                                  child: ListTile(
                                onTap: () {
                                  store.toggleContainer(index);
                                  setState(() {});
                                },
                                title: store.isOpenList[index]
                                    ? SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            buildOrdersDetail(
                                                title: 'Tarih: ',
                                                value: store
                                                    .pendingOrders[index].datetime
                                                    .toString()),
                                            buildOrdersDetail(
                                                title: 'Link: ',
                                                value: store.pendingOrders[index]
                                                    .socialMediaLink,
                                                isLinkText: true,
                                                viewModel: store),
                                            buildOrdersDetail(
                                                title: 'Fiyat: ',
                                                isPriceText: true,
                                                value: store.pendingOrders[index]
                                                    .servicePrice),
                                            buildOrdersDetail(
                                                title: 'Miktar: ',
                                                value: store.pendingOrders[index]
                                                    .serviceAmount),
                                            buildOrdersDetail(
                                                title: 'Servis: ',
                                                value: store.pendingOrders[index]
                                                    .serviceName),
                                            buildOrdersDetail(
                                                title: 'Durum: ',
                                                value: (store.pendingOrders[index]
                                                            .status &&
                                                        !store
                                                            .pendingOrders[index]
                                                            .isCancelled)
                                                    ? 'Tamamlandı'
                                                    : (!store.pendingOrders[index]
                                                                .status &&
                                                            !store
                                                                .pendingOrders[
                                                                    index]
                                                                .isCancelled)
                                                        ? 'Bekleniyor'
                                                        : (store
                                                                .pendingOrders[
                                                                    index]
                                                                .isCancelled)
                                                            ? 'İptal'
                                                            : 'Diğer Durum',
                                                isStatusValue: store
                                                    .pendingOrders[index].status,
                                                isCancelled: store
                                                    .pendingOrders[index]
                                                    .isCancelled),
                                          ],
                                        ),
                                      )
                                    : Text(
                                        store.pendingOrders[index].serviceName),
                                leading: ImageIcon(
                                    AssetImage(store.pendingOrders[index]
                                        .socialMediaName.toPNG),
                                    color: getIconColor(store
                                        .pendingOrders[index].socialMediaName)),
                                trailing: Icon(
                                  (store.pendingOrders[index].status &&
                                          !store.pendingOrders[index].isCancelled)
                                      ? Icons.done
                                      : (!store.pendingOrders[index].status &&
                                              !store.pendingOrders[index]
                                                  .isCancelled)
                                          ? Icons.access_time_outlined
                                          : Icons.cancel,
                                  color: (store.pendingOrders[index].status &&
                                          !store.pendingOrders[index].isCancelled)
                                      ? Colors.green
                                      : (!store.pendingOrders[index].status &&
                                              !store.pendingOrders[index]
                                                  .isCancelled)
                                          ? Colors.blueGrey
                                          : Colors.red,
                                ),
                              )),
                            );
                          },
                        ),
                      ),
                    ),
                )
                : const Center(child: Text('Şu Anda Bekleyen Siparişiniz Yok'));
      },
    );
  }

  Color getIconColor(String socialMediaName) {
    return socialMediaName == 'instagram'
        ? Colors.red
        : socialMediaName == 'twitter'
            ? Colors.blue
            : Colors.black;
  }

  Padding buildOrdersDetail(
      {required String title,
      required String value,
      bool? isStatusValue,
      bool? isCancelled,
      bool? isLinkText,
        bool? isPriceText,
      OrdersPageViewModel? viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          isLinkText != null
              ? GestureDetector(
                  onTap: () {
                    if (viewModel != null) {
                      viewModel.launchURL(value);
                    }
                  },
                  child: const Text(
                    'Linke Git',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ))
              : Text(
                  '$value ',
                  style: TextStyle(
                      color: isStatusValue == null
                          ? Colors.black
                          : ((isStatusValue && !isCancelled!)
                              ? Colors.green
                              : (!isStatusValue && !isCancelled!)
                                  ? Colors.blueGrey
                                  : Colors.red)),
                ),
          if(isPriceText != null && isPriceText)
            Center(
              child: Image.asset(
                'mcoin'.toPNG,
                width: 15,
                height: 15,
              ),
            ),
        ],
      ),
    );
  }
}
