import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/invite_system/components/invited_friends_history_data_table.dart';
import 'package:musmeramedya/ui/invite_system/viewModel/invite_system_page_view_model.dart';

import '../../../core/init/network/network_change_manager.dart';

class InviteSystemPage extends StatelessWidget {
  const InviteSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: InviteSystemPageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel, networkResult) => Scaffold(
              appBar: AppBar(
                title: const Text('Davet Et Kazan'),
              ),
              body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      margin: context.paddingNormal,
                      color: Colors.blue,
                        child:  Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              'Referans kodunuzu kullanarak üye olan arkadaşlarınız her bakiye yüklemesi yaptığında,'
                                  ' yüklenen miktarın %5 lik bir kısmını size hediye ederiz',style: TextStyle(fontSize: 15,color: Colors.grey.shade200)),
                        ))
                  ,
                    Observer(builder: (_){
                      return
                        viewModel.isLoading ? const CircularProgressIndicator() :
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                          child: InvitedFriendsHistoryDataTable(invitedFriendsHistory: viewModel.invitedFriendsHistoryList)
                        );
                    },)
                  ],
                ),
              ),
            ));
  }
}
