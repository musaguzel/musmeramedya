import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../product/helper/responsive.dart';
import '../viewModel/splash_page_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends BaseState<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return BaseView<SplashPageViewModel>(
      viewModel: SplashPageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context,viewModel,networkResult) => buildScaffoldBody(context,viewModel),
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashPageViewModel viewModel) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: Responsive.isDesktop(context) ? const EdgeInsets.only(bottom: 200.0) : const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('logo'.toPNG,width: context.width / 4,height: context.height / 4,),
                const Text("Musmera Medya",style: TextStyle(fontSize: 50),),
              ],
            ),
          ),
        )
    );
  }



}
