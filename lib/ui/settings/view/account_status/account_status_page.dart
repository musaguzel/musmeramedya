import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/network/network_change_manager.dart';
import '../../../../product/helper/responsive.dart';
import '../../../_widgets/dialog/delete_account_dialog.dart';
import '../../viewModel/settings_view_model.dart';



class AccountSettingsPage extends StatelessWidget {
  AccountSettingsPage({super.key});
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: SettingsViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.getIsVerified();
          timer = Timer.periodic(const Duration(seconds: 3), (_) => model.getIsVerified());
        },
        onDispose: (){
          timer?.cancel();
        },
        onPageBuilder: (context, viewModel, networkResult) => Scaffold(
          appBar: buildAppBar,
          body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) : Center(
            child: SizedBox(
              width: Responsive.isDesktop(context)
                  ? context.width / 2
                  : null,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildEmailCard(context, viewModel),
                    buildResendEmailButton(viewModel, context),
                    const Spacer(),
                    buildCard(context, networkResult, viewModel)
                  ],
                ),
            ),
          ),

        ));
  }

  Observer buildResendEmailButton(SettingsViewModel viewModel, BuildContext context) {
    return Observer(builder: (_){
      return Visibility(
        visible: viewModel.emailVerified == true ? false : viewModel.emailVerified == false ? true : false,
        child: Padding(
          padding: context.paddingMediumHorizontal,
          child: ElevatedButton.icon(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.blue)),
              onPressed: (){
                viewModel.sendVerificationEmail();
              }, icon: const Icon(Icons.schedule_send_outlined,color: Colors.white,), label: const Text("Tekrar Gönder",style: TextStyle(color: Colors.white),)),
        ),
      );
    });
  }

  Observer buildEmailCard(BuildContext context, SettingsViewModel viewModel) {
    return Observer(builder: (_){
      return Card(
        color: Colors.grey.shade200,
        margin: context.paddingMedium,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListTile(
              visualDensity: const VisualDensity(horizontal: -3, vertical: 3),
              leading: const Icon(Icons.email),
              title: Text(userModelGlobal.email),
              subtitle: Text(
                viewModel.emailVerified == true
                    ? 'E-mail Onaylandı': viewModel.emailVerified == false
                    ? 'E-mail Onaylanmadı' : "",
                style: TextStyle(
                    color: viewModel.emailVerified == true
                        ? Colors.green
                        : Colors.red),
              ),
            )),
      );
    });
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text('Hesap Durumu'),
    );
  }

  Card buildCard(BuildContext context, NetworkResult networkResult,
      SettingsViewModel viewModel) {
    return Card(
      color: Colors.blueGrey.shade400,
      margin: context.paddingMedium,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: buildDeleteAccountButton(networkResult, context, viewModel)),
    );
  }

  ListTile buildDeleteAccountButton(NetworkResult networkResult,
      BuildContext context, SettingsViewModel viewModel) {
    return ListTile(
      onTap: () {
        if (networkResult == NetworkResult.on) {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                      child: DeleteAccountDialog(
                        settingsPageViewModel: viewModel,
                      )));
        }
      },
      leading: const Icon(Icons.delete_outlined),
      title: const Text('Hesabı Sil'),
    );
  }
}
