import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import 'package:musmeramedya/ui/contact_us/viewModel/contact_us_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/network/network_change_manager.dart';
import '../../../product/helper/responsive.dart';

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
            body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) : Column(
              children: [
                Center(
                  child: SizedBox(
                    width: Responsive.isDesktop(context)
                        ? context.width / 2
                        : null,
                    child: Card(
                      margin: context.paddingNormal,
                      child: ListTile(
                        contentPadding: context.paddingHigh,
                        leading: Image.asset('whatsapp'.toPNG),
                        title: const Text('Whatsapp ile bizimle iletişime geçebilirsiniz'),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: (){
                                openWhatsapp(context);
                            },style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.teal)),child: const Text('İletişime Geç'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
  void openWhatsapp(BuildContext context) async {
    var WhatsappNo = "905061321406";
    var whatsappURL =
    Uri.parse("https://wa.me/$WhatsappNo?text=Merhaba");


    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android|| kIsWeb) {
      if (await canLaunchUrl(whatsappURL)) {
        await launchUrl(whatsappURL);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("İletişim Numarası: $WhatsappNo")));
      }
    }
  }
}
