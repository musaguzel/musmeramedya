// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageViewModel on _MainPageViewModelBase, Store {
  late final _$selectedCategoryAtom =
      Atom(name: '_MainPageViewModelBase.selectedCategory', context: context);

  @override
  OptionModel get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(OptionModel value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedServiceAtom =
      Atom(name: '_MainPageViewModelBase.selectedService', context: context);

  @override
  OptionModel get selectedService {
    _$selectedServiceAtom.reportRead();
    return super.selectedService;
  }

  @override
  set selectedService(OptionModel value) {
    _$selectedServiceAtom.reportWrite(value, super.selectedService, () {
      super.selectedService = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: '_MainPageViewModelBase.categories', context: context);

  @override
  List<OptionModel> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<OptionModel> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$servicesAtom =
      Atom(name: '_MainPageViewModelBase.services', context: context);

  @override
  List<OptionModel> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(List<OptionModel> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  late final _$_MainPageViewModelBaseActionController =
      ActionController(name: '_MainPageViewModelBase', context: context);

  @override
  void setSelectedCategory(OptionModel option) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
        name: '_MainPageViewModelBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(option);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedService(OptionModel option) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
        name: '_MainPageViewModelBase.setSelectedService');
    try {
      return super.setSelectedService(option);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
selectedService: ${selectedService},
categories: ${categories},
services: ${services}
    ''';
  }
}
