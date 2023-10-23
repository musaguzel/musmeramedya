import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_widget.dart';
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
    return const Scaffold(
        body: Center(
          child: Text("Musmera Medya"),
        )
    );
  }



}
