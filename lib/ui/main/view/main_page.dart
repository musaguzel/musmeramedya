import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/constants/application/app_strings.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/main/viewModel/main_page_view_model.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/application/application_constants.dart';
import '../../../core/init/network/network_change_manager.dart';
import '../../../product/widgets/shimmer/shimmer_widget.dart';
import '../components/navigation_drawer.dart';
import '../model/option_model/option_model.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: MainPageViewModel(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
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
        body: SingleChildScrollView(
          child: Column(children: [
            Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle(ApplicationStrings.MAIN_CATEGORY),
                      buildDropdownCategory(
                          isCategoryOption: true,
                          selectedOption: store.selectedCategory,
                          options: store.categories,
                          store: store),
                      buildTitle(ApplicationStrings.MAIN_SERVIS),
                      buildDropdownCategory(
                          isCategoryOption: false,
                          selectedOption: store.selectedService,
                          options: store.services,
                          store: store),
                      buildTitle(ApplicationStrings.MAIN_LINK),
                      buildTextField(controller: store.linkController,isAmount: false),
                      buildTitle(ApplicationStrings.MAIN_AMOUNT),
                      buildTextField(controller: store.amountController,isAmount: true),
                      buildMinMaksAmount,
                      buildAverageTimeText,
                      buildTimeAndPriceInfoText(needPadding: false), //saat bilgileri ve para bilgileri veritabanından çekilip parantez içinde bu tarafa verilecek
                      buildTimeAndPriceInfoText(needPadding: true), //saat bilgileri ve para bilgileri veritabanından çekilip parantez içinde bu tarafa verilecek
                      buildCreateOrderButton()
                    ],
                  )),
            )
          ]),
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
      {required MainPageViewModel store,
        required OptionModel selectedOption,
        required List<OptionModel> options,
        required bool isCategoryOption}) {
    return Observer(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Arka plan rengi beyaz
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: DropdownButton<OptionModel>(
          padding: context.paddingNormal,
          isDense: true,
          isExpanded: true,
          value: options.firstWhere(
                  (option) => option.text == selectedOption.text,
              orElse: () => options[0]),
          onChanged: (OptionModel? newValue) {
            if (newValue != null) {
              isCategoryOption
                  ? store.setSelectedCategory(newValue)
                  : store.setSelectedService(newValue);
            }
          },
          items:
          options.map<DropdownMenuItem<OptionModel>>((OptionModel option) {
            return DropdownMenuItem<OptionModel>(
              value: option,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:"https://cdn4.iconfinder.com/data/icons/social-media-black-white-2/600/Instagram_glyph_svg-512.png",
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        ShimmerWidget.rectangular(heigth: 15),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  const SizedBox(width: 8),
                  Text(option.text),
                ],
              ),
            );
          }).toList(),
          style: const TextStyle(color: Colors.black),
          dropdownColor: Colors.blueGrey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
      );
    });
  }

  Observer buildTextField({required TextEditingController controller,required bool isAmount}) {
    return Observer(
      builder: (_) {
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
          child: TextFormField(
            keyboardType: isAmount ? TextInputType.number: TextInputType.text,
            controller: controller,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10.0),
            ),
          ),
        );
      },
    );
  }
  Padding get buildMinMaksAmount {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 4.0),
      child: Text('Minimum: 100 - Maksimum: 15000',style: TextStyle(color: Colors.black.withOpacity(0.7)),),
    );
  }
  Observer buildTimeAndPriceInfoText({required bool needPadding}) {
    return Observer(builder: (_){
      return Padding(
        padding: EdgeInsets.only(top: needPadding ? 8.0 : 0),
        child: Container(
          width: double.infinity,
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
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '1 Saat 32 Dakika',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    });
  }
  ListTile get buildAverageTimeText {
    return const ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      visualDensity: VisualDensity(horizontal: -4,vertical: 0),
                      title: Text(ApplicationStrings.MAIN_AVERAGE_TIME,style: TextStyle(fontWeight: FontWeight.bold),),
                      leading: Icon(Icons.info,color: Colors.black),
                    );
  }
  Padding buildCreateOrderButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 1.0,top: 4.0),
      child: ElevatedButton(onPressed: (){

      }, child: Text(ApplicationStrings.MAIN_CREATE_ORDER)),
    );
  }
}
