// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageViewModel on _MainPageViewModelBase, Store {
  late final _$socialMediaServicesAtom = Atom(
      name: '_MainPageViewModelBase.socialMediaServices', context: context);

  @override
  ObservableList<SocialMediaServiceModel> get socialMediaServices {
    _$socialMediaServicesAtom.reportRead();
    return super.socialMediaServices;
  }

  @override
  set socialMediaServices(ObservableList<SocialMediaServiceModel> value) {
    _$socialMediaServicesAtom.reportWrite(value, super.socialMediaServices, () {
      super.socialMediaServices = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_MainPageViewModelBase.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_MainPageViewModelBase.selectedCategory', context: context);

  @override
  SocialMediaServiceModel? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(SocialMediaServiceModel? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedServiceAtom =
      Atom(name: '_MainPageViewModelBase.selectedService', context: context);

  @override
  Map<String, dynamic>? get selectedService {
    _$selectedServiceAtom.reportRead();
    return super.selectedService;
  }

  @override
  set selectedService(Map<String, dynamic>? value) {
    _$selectedServiceAtom.reportWrite(value, super.selectedService, () {
      super.selectedService = value;
    });
  }

  late final _$livePriceAtom =
      Atom(name: '_MainPageViewModelBase.livePrice', context: context);

  @override
  String get livePrice {
    _$livePriceAtom.reportRead();
    return super.livePrice;
  }

  @override
  set livePrice(String value) {
    _$livePriceAtom.reportWrite(value, super.livePrice, () {
      super.livePrice = value;
    });
  }

  late final _$isOrderSavingAtom =
      Atom(name: '_MainPageViewModelBase.isOrderSaving', context: context);

  @override
  bool get isOrderSaving {
    _$isOrderSavingAtom.reportRead();
    return super.isOrderSaving;
  }

  @override
  set isOrderSaving(bool value) {
    _$isOrderSavingAtom.reportWrite(value, super.isOrderSaving, () {
      super.isOrderSaving = value;
    });
  }

  late final _$verileriAlAsyncAction =
      AsyncAction('_MainPageViewModelBase.verileriAl', context: context);

  @override
  Future<void> verileriAl() {
    return _$verileriAlAsyncAction.run(() => super.verileriAl());
  }

  late final _$updateUserInfoAsyncAction =
      AsyncAction('_MainPageViewModelBase.updateUserInfo', context: context);

  @override
  Future<void> updateUserInfo(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return _$updateUserInfoAsyncAction
        .run(() => super.updateUserInfo(snapshot));
  }

  late final _$saveOrderAsyncAction =
      AsyncAction('_MainPageViewModelBase.saveOrder', context: context);

  @override
  Future<void> saveOrder() {
    return _$saveOrderAsyncAction.run(() => super.saveOrder());
  }

  late final _$_MainPageViewModelBaseActionController =
      ActionController(name: '_MainPageViewModelBase', context: context);

  @override
  void setSelectedCategory(SocialMediaServiceModel? socialMediaServiceModel) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
        name: '_MainPageViewModelBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(socialMediaServiceModel);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedService(String? sosyalMedyaVeriler) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
        name: '_MainPageViewModelBase.setSelectedService');
    try {
      return super.setSelectedService(sosyalMedyaVeriler);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculatePrice() {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
        name: '_MainPageViewModelBase.calculatePrice');
    try {
      return super.calculatePrice();
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
socialMediaServices: ${socialMediaServices},
currentUser: ${currentUser},
selectedCategory: ${selectedCategory},
selectedService: ${selectedService},
livePrice: ${livePrice},
isOrderSaving: ${isOrderSaving}
    ''';
  }
}
