import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import 'package:musmeramedya/ui/_widgets/drawer/navigation_drawer.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
import '../../../core/init/network/network_change_manager.dart';
import '../../../product/helper/responsive.dart';
import '../viewModel/profile_page_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ProfilePageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel, networkResult) => Scaffold(
        drawer: NavigationDrawerMain(),
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          title: const Text('Hesap'),
        ),
        resizeToAvoidBottomInset: false,
        body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) : Center(
          child: SizedBox(
            width: Responsive.isDesktop(context)
                ? context.width / 2
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRowUserInfo(context,viewModel),
                buildSettingsList(viewModel),
                buildExitButton(viewModel, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildRowUserInfo(BuildContext context,ProfilePageViewModel viewModel) {
    return Expanded(
      flex: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ListTile(
              subtitle: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(userModelGlobal.fullName,
                      style: TextStyle(fontSize: Responsive.isMobile(context)? 24 : 35,color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: Responsive.isMobile(context) ? const EdgeInsets.only(top: 2.0,bottom: 2.0) : const EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: const Center(child: Text('Arkadaş Davet Kodunuz')),
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                          viewModel.copyReferenceCode(userModelGlobal.referenceCode.toString());
                      },
                      label: Text(userModelGlobal.referenceCode.toString()),
                      icon: const Icon(Icons.copy,size: 15,),
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(fontSize: 12)),
                         minimumSize: MaterialStateProperty.all<Size>(const Size(50, 25)), // İstediğiniz değeri deneyebilirsiniz
                         maximumSize: MaterialStateProperty.all<Size>(const Size(120, 40)), // İstediğiniz değeri deneyebilirsiniz
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundImage: AssetImage('avatar'.toPNG),
              radius: 50,
            ),
          )
        ],
      ),
    );
  }

  Expanded buildSettingsList(ProfilePageViewModel viewModel) {
    return Expanded(
      flex: 10,
      child: ListView(
        children: <Observer>[
          buildLSettingsList(
              viewModel: viewModel,
              leadingIcon: Icons.person_add_alt_1_outlined,
              title: 'Arkadaşlarını Davet Et Kazan',
              trailingIcon: Icons.arrow_right,
              whichPageToGo: NavigationConstants.INVITED_SYSTEM),
          buildLSettingsList(
              viewModel: viewModel,
              leadingIcon: Icons.change_circle_outlined,
              title: 'Şifre Değiştir',
              trailingIcon: Icons.arrow_right,
              whichPageToGo: NavigationConstants.CHANGE_PASSWORD),
          buildLSettingsList(
              viewModel: viewModel,
              leadingIcon: Icons.person,
              title: 'Hesap Durumu',
              trailingIcon: Icons.arrow_right,
              whichPageToGo: NavigationConstants.ACCOUNT_STATUS),
        ],
      ),
    );
  }

  Observer buildLSettingsList(
      {required ProfilePageViewModel viewModel,
      required String title,
      required IconData leadingIcon,
      required IconData trailingIcon,
      required String whichPageToGo}) {
    return Observer(builder: (_){
     return ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.blue,
        ),
        title: Text(title),
        trailing: Icon(trailingIcon),
        onTap: () => viewModel.navigation.navigateToPage(path: whichPageToGo),
      );
    });
  }

  Expanded buildExitButton(
      ProfilePageViewModel viewModel, BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Observer(builder: (_){
          return OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blueGrey.shade400),
                minimumSize:
                MaterialStateProperty.all(Size(context.width / 1.2, 40))),
            onPressed: () {
              viewModel.firebaseAuth.signOut();
            },
            child: const Text(
              'Çıkış Yap',
              style: TextStyle(color: Colors.white),
            ),
          );
        },)
      ),
    );
  }
}
