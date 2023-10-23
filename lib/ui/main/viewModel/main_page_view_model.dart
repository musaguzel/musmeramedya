import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../model/option_model.dart';

part 'main_page_view_model.g.dart';

class MainPageViewModel = _MainPageViewModelBase with _$MainPageViewModel;

abstract class _MainPageViewModelBase with Store, BaseViewModel {

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController linkController =TextEditingController();
  TextEditingController amountController =TextEditingController();

  @observable
  OptionModel selectedCategory = OptionModel("Kategori", Icons.add); // Seçilen öğenin başlangıç değeri boş bir metin olabilir.
  @observable
  OptionModel selectedService = OptionModel("Kategori", Icons.add); // Seçilen öğenin başlangıç değeri boş bir metin olabilir.

  @observable
  List<OptionModel> categories = [
    OptionModel('Instagram', Icons.star),
    OptionModel('Tiktok', Icons.favorite),
    OptionModel('Twitter', Icons.face),
  ];

  @observable
  List<OptionModel> services = [
    OptionModel('Instagram', Icons.star),
    OptionModel('Tiktok', Icons.favorite),
    OptionModel('Twitter', Icons.face),
  ];

  @action
  void setSelectedCategory(OptionModel option) {
    selectedCategory = option;
  }

  @action
  void setSelectedService(OptionModel option) {
    selectedService = option;
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {}
}


