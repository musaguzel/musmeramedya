import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import 'package:musmeramedya/ui/contact_us/viewModel/contact_us_view_model.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/network/network_change_manager.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ContactUsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, viewModel, networkResult) =>
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Bize Ulaşın'),
            ),
            body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) : Card(
              margin: context.paddingNormal,
              child: ListTile(
                contentPadding: context.paddingNormal,
                leading: Image.asset('whatsapp'.toPNG),
                title: Text('Whatsapp ile bizimle iletişime geçebilirsiniz'),
                subtitle: ElevatedButton(
                  onPressed: (){
                      openWhatsapp(context);
                  },style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.teal)),child: const Text('İletişime Geç'),
                ),
              ),
            ),
          ),
    );
  }
  void openWhatsapp(BuildContext context) async {
    var WhatsappNo = "905061321406";
    var whatsappURL =
    Uri.parse("https://wa.me/$WhatsappNo?text=Merhaba");

    if (Platform.isIOS) {
      if (await canLaunchUrl(whatsappURL)) {
        await launchUrl(whatsappURL);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("İletişim Numarası: $WhatsappNo")));
      }
    } else {
      if (await canLaunchUrl(whatsappURL)) {
        await launchUrl(whatsappURL);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("İletişim Numarası: $WhatsappNo")));
      }
    }
  }
}
