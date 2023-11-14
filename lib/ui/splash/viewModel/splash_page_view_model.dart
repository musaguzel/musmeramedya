import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
import '../../../core/init/network/network_change_manager.dart';
part 'splash_page_view_model.g.dart';

class SplashPageViewModel = _SplashPageViewModelBase with _$SplashPageViewModel;

abstract class _SplashPageViewModelBase with Store, BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final INetworkChangeManager _networkChange = NetworkChangeManager();
  NetworkResult? _networkResult;


  @observable
  bool? isAppUpToDate;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    fetchFirstResult();
    Future.delayed(const Duration(seconds: 2)).then((value) {

      _auth.authStateChanges().listen((User? user) {
        if (user == null) {
          navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
          print("çıkış yapıldı");
        } else {
          navigation.navigateToPageClear(path: NavigationConstants.MAIN,data: isAppUpToDate ?? true);
          print("giriş yapıldı");
        }
      });
    });
  }


  @action
  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  @action
  void _updateView(NetworkResult result) {
    _networkResult = result;
  }
}
