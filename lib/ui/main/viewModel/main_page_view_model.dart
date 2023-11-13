import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import 'package:musmeramedya/ui/main/model/social_media_model/social_media_service_model.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import 'package:musmeramedya/ui/orders/model/orders_model.dart';
import 'package:musmeramedya/ui/register/model/user_model.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
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
    getUserInfoStream().listen(updateUserInfo);
    await verileriAl();
  }


  @observable
  ObservableList<SocialMediaServiceModel> socialMediaServices = ObservableList<SocialMediaServiceModel>();

  @action
  Future<void> verileriAl() async {
    final socialMediaQuery = firebaseFirestore.collection('categories').snapshots();
    socialMediaQuery.listen((snapshot) async {
      socialMediaServices.clear();
      socialMediaServices.addAll(snapshot.docs.map((doc) => SocialMediaServiceModel.fromJson(doc.data())));

      // Veritabanı güncellendikten sonra seçili değeri kontrol edin ve güncelleyin.
      if (selectedCategory != null &&
          socialMediaServices.indexOf(selectedCategory) == -1) {

        int selectedIndex = -1;  // Eşleşen öğenin indeksi
        for (int i = 0; i < socialMediaServices.length; i++) {
          if (socialMediaServices[i].categoryName == selectedCategory?.categoryName) {
            selectedIndex = i;  // Eşleşen öğenin indeksi
            setSelectedCategory(socialMediaServices[i]);
            break;  // Eşleşen öğeyi bulduk, döngüden çık
          }else {
            setSelectedCategory(socialMediaServices.first);
          }
        }
      }
    });
  }
  @observable
  UserModel? currentUser;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserInfoStream() {
    return firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .snapshots();
  }

  @action
  Future<void> updateUserInfo(
      DocumentSnapshot<Map<String, dynamic>> snapshot) async {
    if (snapshot.exists) {
      UserModel user =
      UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      currentUser = user;
      userModelGlobal = user;
    }
  }




  @action
  void setSelectedCategory(SocialMediaServiceModel? socialMediaServiceModel) {
    selectedCategory = socialMediaServiceModel;
    selectedService?.clear();
    selectedService = {                                                           //Bir kategori seçildiğinde servisi, seçilen kategorinin servisinin ilk öğesini koy
      'servicename': selectedCategory?.serviceNames[0].toString(),
      'serviceaveragetime': selectedCategory?.serviceAverageTime[0].toString(),
      'serviceprice': selectedCategory?.servicePrice[0].toString(),
    };
  }

  @action
  void setSelectedService(String? sosyalMedyaVeriler) {                  //Bir servis seçildiğinde seçilen kategorinin servislerinde tıklanılan servisini bul ve indeksini al
    var index = selectedCategory?.serviceNames.indexOf(sosyalMedyaVeriler!) ?? 1;
    String serviceAverageTime = selectedCategory?.serviceAverageTime[index].toString() ?? '1 saat';  //Aynı indeksteki servis tamamlanma zamanını al
    String servicePrice = selectedCategory?.servicePrice[index].toString() ?? '10 tl';  //Aynı indeksteki servis tamamlanma zamanını al
    int formattedServicePrice = int.parse(servicePrice);
    selectedService?.clear();
    selectedService = {                                                           //seçilen servisi ismini ekle zamanını ekle,seçilen servisi oluştur
      'servicename': sosyalMedyaVeriler,
      'serviceaveragetime': serviceAverageTime,
      'serviceprice': formattedServicePrice,
    };
  }


  @action
  void calculatePrice(){
      if(selectedService != null){
        amountController.text.isEmpty ? livePrice = "Fiyat" : livePrice = "";
        int formattedPrice = int.parse(selectedService!['serviceprice'].toString()); //veritabanından gelen 1 adet servisin fiyatı
        int formattedAmount = amountController.text.isNotEmpty ? int.parse(amountController.text) : 0;  //Kullanıcının istediği miktar
        var realPrice = formattedPrice * formattedAmount;                                  //Kullanıcıya sunulacak fiyat

        livePrice = realPrice == 0 ? "Fiyat" : realPrice.toString();
      }
  }

  @action
  Future<void> saveOrder() async {
    CollectionReference userCol = firebaseFirestore.collection('users');
    isOrderSaving = true;
    if(firebaseAuth.currentUser != null){
      int? parsedValue = int.tryParse(livePrice);
      if(currentUser!= null){
        if(currentUser!.balance >= parsedValue!){
          if(selectedCategory != null && livePrice.isNotEmpty && amountController.text.isNotEmpty && linkController.text.isNotEmpty && linkController.text.trim().isValidURL){
            final formattedDate = DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now());
            OrdersModel order = OrdersModel(userID: firebaseAuth.currentUser!.uid, datetime: formattedDate,serviceName: selectedService?['servicename'].toString() ?? 'null' ,servicePrice: livePrice, serviceAmount: amountController.text, socialMediaLink: linkController.text, socialMediaName:
            selectedCategory?.socialMediaName ?? "instagram",isCancelled: false,status: false);
            await userCol.doc(firebaseAuth.currentUser?.uid).collection('orders_history').add(order.toJson()).then((value) {
              var updatedBalance = currentUser!.balance - parsedValue;
              userCol.doc(firebaseAuth.currentUser?.uid).update({'balance': updatedBalance});
              userCol.doc(firebaseAuth.currentUser?.uid).collection('orders_history').doc(value.id).update({'order_id' : value.id});
              showsnackbar(message: 'Siparişiniz Kaydedildi',backgroundColor: Colors.green);
            });
            navigation.navigateToPageClear(path: NavigationConstants.ORDERS);
          }else{
            showsnackbar(message: 'Lütfen Bilgileri Eksiksiz, Doğru Girin');
          }
        }else {
          showsnackbar(message: 'Bakiyeniz Yetersiz',snackBarAction: SnackBarAction(label: 'Bakiye Yükle', onPressed: () => navigation.navigateToPage(
            path: NavigationConstants.ADD_BALANCE
          )));
        }
      }

    }
    isOrderSaving = false;

  }


  @observable
  SocialMediaServiceModel? selectedCategory;
  @observable
  Map<String,dynamic>? selectedService;
  @observable
  String livePrice = "Fiyat";
  @observable
  bool isOrderSaving = false;

}


