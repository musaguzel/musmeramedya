import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import '../../../core/base/model/base_view_model.dart';
import '../model/contact_us_model.dart';
part 'support_page_view_model.g.dart';

class SupportPageViewModel = _SupportPageViewModelBase with _$SupportPageViewModel;

abstract class _SupportPageViewModelBase with Store, BaseViewModel {

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Future<void> init() async {

  }
  @override
  void setContext(BuildContext context) => viewModelContext = context;


  @action
  Future<void> sendMessageToFirebase(String email) async {
    ContactUsModel contactUsModel = ContactUsModel(name: nameController.text, email: emailController.text, message: messageController.text,userId: userModelGlobal.userID.toString());
    await firebaseFirestore.collection("support").doc(email).set(contactUsModel.toJson()).then((value) {
      showsnackbar(message: 'Mesajınız iletildi',backgroundColor: Colors.teal);
      navigation.navigateToPageClear(path: NavigationConstants.MAIN);
    })
        .catchError((error) {
      showsnackbar(message: error.toString(),backgroundColor: Colors.grey);
    });
  }


}