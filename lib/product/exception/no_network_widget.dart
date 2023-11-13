import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/login/viewModel/login_page_view_model.dart';
import '../../core/base/view/base_widget.dart';
import '../../core/init/network/network_change_manager.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: LoginPageViewModel(),
        onModelReady: (model) {},
        onPageBuilder: (context, viewModel, networkResult) =>
            buildAnimatedCrossFade(context, networkResult));
  }

  AnimatedCrossFade buildAnimatedCrossFade(
      BuildContext context, NetworkResult networkResult) {
    return AnimatedCrossFade(
      duration: context.lowDuration,
      crossFadeState: networkResult == NetworkResult.off
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        height: context.height * 0.1,
        width: context.width,
        child: const Text(
          'İnternet Bağlantınızı Kontrol Edin',
          textAlign: TextAlign.center,
        ),
      ),
      secondChild: const SizedBox(),
    );
  }
}
