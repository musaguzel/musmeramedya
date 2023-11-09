import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import 'package:musmeramedya/ui/_widgets/drawer/navigation_drawer.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRowUserInfo(viewModel,context),
            buildSettingsList(viewModel),
            buildExitButton(viewModel, context),
          ],
        ),
      ),
    );
  }

  Expanded buildRowUserInfo(ProfilePageViewModel viewModel,BuildContext context) {
    return Expanded(
      flex: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Observer(
            builder: (_){
              return Text(userModelGlobal.fullName,style: const TextStyle(fontSize: 24),);
            },),
          CircleAvatar(
            backgroundImage:
            AssetImage('avatar'.toPNG),
            radius: 50,
          )
        ],
      ),
    );
  }

  Expanded buildSettingsList(ProfilePageViewModel viewModel) {
    return Expanded(
      flex: 10,
      child: ListView(
        children: <ListTile>[
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

  ListTile buildLSettingsList(
      {required ProfilePageViewModel viewModel,
      required String title,
      required IconData leadingIcon,
      required IconData trailingIcon,
      required String whichPageToGo}) {
    return ListTile(
      leading: Icon(leadingIcon,color: Colors.blue,),
      title: Text(title),
      trailing: Icon(trailingIcon),
      onTap: () => viewModel.navigation.navigateToPage(path: whichPageToGo),
    );
  }

  Expanded buildExitButton(
      ProfilePageViewModel viewModel, BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: OutlinedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.red.shade800),
              minimumSize:
                  MaterialStateProperty.all(Size(context.width / 1.2, 40))),
          onPressed: () {
            viewModel.firebaseAuth.signOut();
          },
          child: const Text(
            'Çıkış Yap',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
