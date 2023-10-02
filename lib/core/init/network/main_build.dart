import 'package:flutter/material.dart';
import '../../../product/exception/no_network_widget.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: child ?? const SizedBox(),
          ),
          const NoNetworkWidget(),
        ],
      ),
    );
  }
}