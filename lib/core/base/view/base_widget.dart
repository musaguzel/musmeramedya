import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../init/network/network_change_manager.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
  }) : super(key: key);
  final Widget Function(BuildContext context, T value, NetworkResult networkResult) onPageBuilder;
  final T viewModel;
  final void Function(T model) onModelReady;
  final VoidCallback? onDispose;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> with StateMixin {
  late T model;

  late final INetworkChangeManager networkChange;
  NetworkResult networkResult = NetworkResult.on;


  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model,networkResult);
  }


  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    networkChange = NetworkChangeManager();
    fetchFirstResult();
    waitForScreen(() {
      networkChange.handleNetworkChange((result) {
        print(result);
        _updateView(result);
      });
    });
    super.initState();
  }



  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose?.call();
    super.dispose();
  }
  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }
  void _updateView(NetworkResult result) {
    setState(() {
      networkResult = result;
    });
  }


}



mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}