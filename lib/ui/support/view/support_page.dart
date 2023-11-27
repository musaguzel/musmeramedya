import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import 'package:musmeramedya/ui/support/viewModel/support_page_view_model.dart';

void main() => runApp(const SupportPage());

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: SupportPageViewModel(),
        onModelReady: (model){

        },
        onPageBuilder: (context,viewModel,networkResult) => Scaffold(
          appBar: AppBar(
            title: const Text('Destek'),
          ),
          body: Tawk(
            directChatLink: 'https://tawk.to/chat/65639468da19b3621790edb7/1hg6fneo4',
            visitor: TawkVisitor(
              name: userModelGlobal.fullName,
              email: userModelGlobal.email,
            ),
            onLoad: () {
              print('Hello Tawk!');
            },
            onLinkTap: (String url) {
              print(url);
            },
            placeholder: const Center(
              child: Text('Loading...'),
            ),
          ),
        ),);
  }
}