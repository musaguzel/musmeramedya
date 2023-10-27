import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:musmeramedya/ui/main/model/social_media_model/social_media_service_model.dart';
import '../../../core/base/model/base_view_model.dart';
part 'main_page_view_model.g.dart';

class MainPageViewModel = _MainPageViewModelBase with _$MainPageViewModel;

abstract class _MainPageViewModelBase with Store, BaseViewModel {

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController linkController =TextEditingController();
  TextEditingController amountController =TextEditingController();

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
   await verileriAl();
  }


  @observable
  ObservableList<SocialMediaServiceModel> socialMediaServices = ObservableList<SocialMediaServiceModel>();



  @action
  Future<void> verileriAl() async {
    final socialMediaQuery = firebaseFirestore.collection('categories').snapshots();
    socialMediaQuery.listen((snapshot) {
      socialMediaServices.clear();
      socialMediaServices.addAll(snapshot.docs.map((doc) => SocialMediaServiceModel.fromJson(doc.data())));
      print(socialMediaServices.toString());
    });
  }


  @action
  void setSelectedCategory(SocialMediaServiceModel socialMediaServiceModel) {
    selectedCategory = socialMediaServiceModel;
  }

  @action
  void setSelectedService(String sosyalMedyaVeriler) {
    selectedService = sosyalMedyaVeriler;
  }

  @observable
  SocialMediaServiceModel? selectedCategory;
  @observable
  String? selectedService;

}


