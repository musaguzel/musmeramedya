import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/model/base_view_model.dart';

part 'profile_page_view_model.g.dart';

class ProfilePageViewModel = _ProfilePageViewModelBase
    with _$ProfilePageViewModel;

abstract class _ProfilePageViewModelBase with Store, BaseViewModel {

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {

  }

  @action
  void copyReferenceCode(String referenceCode) {
    Clipboard.setData(ClipboardData(text: referenceCode));
    showsnackbar(message: 'Metin Kopyalandı',backgroundColor: Colors.teal);
  }
}