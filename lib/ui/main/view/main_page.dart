import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import 'package:musmeramedya/product/helper/responsive.dart';
import 'package:musmeramedya/ui/main/model/social_media_model/social_media_service_model.dart';
import 'package:musmeramedya/ui/main/viewModel/main_page_view_model.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/app_strings.dart';
import '../../../core/init/constants/app/app_constants.dart';
import '../../../core/init/network/network_change_manager.dart';
import '../../register/model/user_model.dart';
import '../../_widgets/drawer/navigation_drawer.dart';


    UserModel userModelGlobal = UserModel(fullName: "", email: "", balance: 0, userID: "",referenceCode: "");
class MainPage extends StatelessWidget {
   MainPage({super.key});

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: MainPageViewModel(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
          },
        onDispose: (){
          _focusNode.dispose();
        },
        onPageBuilder: (context, store, networkResult) =>
            buildScaffold(context, store, networkResult));
  }

  Scaffold buildScaffold(BuildContext context, MainPageViewModel store,
      NetworkResult networkResult) {
    return Scaffold(
      drawer: NavigationDrawerMain(),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(ApplicationConstants.APPNAME),
        ),
        body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) : GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                child: SizedBox(
                  width: Responsive.isDesktop(context) ? context.width / 2 : null,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                        padding: const EdgeInsets.all( 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitle(ApplicationStrings.MAIN_CATEGORY),
                            buildDropdownCategory(
                                store: store,context: context),
                            buildTitle(ApplicationStrings.MAIN_SERVIS),
                            buildDropdownService(
                                store: store,context: context),
                            buildTitle(ApplicationStrings.MAIN_LINK),
                            buildTextField(store: store,isAmount: false),
                            buildTitle(ApplicationStrings.MAIN_AMOUNT),
                            buildTextField(store: store,isAmount: true),
                            buildMinMaksAmount,
                            buildAverageTimeText(store),
                            buildTimeAndPriceInfoText(store: store,needPadding: false,isPriceText: false), //saat bilgileri ve para bilgileri veritabanından çekilip parantez içinde bu tarafa verilecek
                            buildTimeAndPriceInfoText(store: store,needPadding: true,isPriceText: true), //saat bilgileri ve para bilgileri veritabanından çekilip parantez içinde bu tarafa verilecek
                            buildCreateOrderButton(context,store,networkResult)
                          ],
                        )),
                  ),
                ),
              )
            ]),
          ),
        ));
  }

  Padding buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, bottom: 8.0, top: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Observer buildDropdownCategory(
      {required MainPageViewModel store,required BuildContext context}) {
    return Observer(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Arka plan rengi beyaz
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),


        child: DropdownButtonHideUnderline(
          child: DropdownButton<SocialMediaServiceModel>(
            isExpanded: true,
            isDense: true,
            padding: context.paddingNormal,
            value:  store.selectedCategory,
            hint: const Text(ApplicationStrings.MAIN_CHOSE_CATEGORY,style: TextStyle(color: Colors.black),),
            items: store.socialMediaServices
                .map((category) => DropdownMenuItem<SocialMediaServiceModel>(
              value: category,
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(category.socialMediaName.toPNG),
                    color: getIconColor(category.socialMediaName),
                  ),
                  const SizedBox(width: 8),
                  Text(category.categoryName), // Kategori adı
                ],
              ),
            ))
                .toList(),
            onChanged: (value) => store.setSelectedCategory(value),

            style: const TextStyle(color: Colors.black),
            dropdownColor: Colors.blueGrey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    });
  }

  Observer buildDropdownService(
      {required MainPageViewModel store,required BuildContext context}) {
    return Observer(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Arka plan rengi beyaz
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: AbsorbPointer(
          absorbing: store.selectedCategory != null ? false : true,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              isDense: true,
              padding: context.paddingNormal,
              value: (store.selectedService != null && store.selectedService!.isNotEmpty) ? store.selectedService!['servicename'].toString() : store.selectedCategory?.serviceNames[0].toString(),
              hint: Text(ApplicationStrings.MAIN_CHOSE_SERVICE,style: TextStyle(color: store.selectedCategory != null ? Colors.black : Colors.black.withOpacity(0.7)),),
              items: store.selectedCategory?.serviceNames.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(store.selectedCategory!.socialMediaName.toPNG),
                        color: getIconColor(store.selectedCategory!.socialMediaName),
                      ),
                      const SizedBox(width: 8),
                      Text(item), // Kategori adı
                    ],
                  ),
                );
              }).toList() ,
              onChanged: (value) {
                store.setSelectedService(value);
                store.amountController.clear();
                store.livePrice = "Fiyat";
              },

              style: const TextStyle(color: Colors.black),
              dropdownColor: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(15),
            ) ,
          ),
        ),
      );
    });
  }

  Container buildTextField({required MainPageViewModel store,required bool isAmount}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Arka plan rengi beyaz
        borderRadius:
        const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            // Neon gibi parlak mavi renk
            blurRadius: 10.0,
            // Bulanıklık miktarı
            spreadRadius: 1.0,
            // Yayılma miktarı
            offset: const Offset(0, 0), // Gölgenin yönü
          ),
        ],
      ),
      child: Observer(builder: (_){
        return TextFormField(
          onChanged: (value){
            store.calculatePrice();
          },
          keyboardType: isAmount ? TextInputType.number: TextInputType.text,
          controller: isAmount ? store.amountController : store.linkController,
          maxLength: isAmount ? 19 : null,
          buildCounter: (BuildContext context, {required int? currentLength, required bool? isFocused, int? maxLength}) => Container(),
          style: const TextStyle(
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10.0),
          ),
        );
      },)
    );
  }

  Padding get buildMinMaksAmount {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 4.0),
      child: Text('Minimum: 50',style: TextStyle(color: Colors.black.withOpacity(0.7)),),
    );
  }

  ListTile buildAverageTimeText(MainPageViewModel store) {
    return const ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      visualDensity: VisualDensity(horizontal: -4,vertical: 0),
      title:  Text(ApplicationStrings.MAIN_AVERAGE_TIME,style: TextStyle(fontWeight: FontWeight.bold),),
      leading: Icon(Icons.info,color: Colors.black),
    );
  }

  Observer buildTimeAndPriceInfoText({required MainPageViewModel store,required bool needPadding,required bool isPriceText}) {
    return Observer(builder: (_){
      return Padding(
        padding: EdgeInsets.only(top: needPadding ? 8.0 : 0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7), // Arka plan rengi beyaz
            borderRadius:
            const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                // Neon gibi parlak mavi renk
                blurRadius: 0.0,
                // Bulanıklık miktarı
                spreadRadius: 1.0,
                // Yayılma miktarı
                offset: const Offset(0, 0), // Gölgenin yönü
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                    isPriceText ? ('${store.livePrice} ') : (store.selectedService?['serviceaveragetime'].toString() ?? ApplicationStrings.MAIN_AVERAGE_TIME),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if(isPriceText)
                  Center(
                    child: Image.asset(
                      'mcoin'.toPNG,
                      width: 15,
                      height: 15,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Observer buildCreateOrderButton(BuildContext context,MainPageViewModel store,NetworkResult networkResult) {
    return Observer(builder: (_){
      return
      !store.isOrderSaving ?
       Padding(
        padding: EdgeInsets.only(left: 1.0,top: Responsive.isMobile(context) ? 8 : 20 ),
        child: ElevatedButton(onPressed: (){
              if(networkResult == NetworkResult.on){
                store.saveOrder();
              }
        }, child:  const Text(ApplicationStrings.MAIN_CREATE_ORDER)),
      ):  const Padding(
        padding: EdgeInsets.only(left: 1.0,top: 20.0),
        child: Center(child: CircularProgressIndicator()),
      );
    });
  }
  
  Color getIconColor(String socialMediaName){
     return socialMediaName == 'instagram' ? Colors.red :
        socialMediaName == 'twitter' ? Colors.blue : Colors.black;
  }
}

