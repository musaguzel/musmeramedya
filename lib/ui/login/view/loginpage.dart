import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/base/view/base_widget.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/init/constants/app/app_constants.dart';
import 'package:musmeramedya/product/helper/responsive.dart';
import 'package:musmeramedya/ui/login/viewModel/login_page_view_model.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
import '../../../core/init/network/network_change_manager.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: LoginPageViewModel(),
        onModelReady: (model){
          model.init();
          model.setContext(context);
        },
      onPageBuilder: (context,store,networkResult) => buildScaffold(context, store,networkResult) );
  }

  Scaffold buildScaffold(BuildContext context, LoginPageViewModel store,NetworkResult networkResult) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: buildAppBar,
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: Responsive.isDesktop(context) ? context.width / 2 : null,
                    child: Card(
                      margin: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTextfieldTitle(context,"Kullanıcı Adı"),
                            buildSizedBox,
                            buildTextFieldEmail(store),
                            buildSizedBox,
                            buildTextfieldTitle(context,"Şifre"),
                            buildSizedBox,
                            buildTextFieldPassword(store),
                            buildSizedBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(onPressed: (){
                                  FocusScope.of(context).unfocus();
                                  if (store.emailController.text.isNotEmpty &&
                                      store.passwordController.text.isNotEmpty) {
                                    store.loginWithEmailAndPassword(context);
                                  }
                                }, child: const Text('Giriş Yap')),
                                TextButton(onPressed: (){
                                  store.navigation.navigateToPage(path: NavigationConstants.FORGOT_PASSWORD);
                                }, child: const Text('Şifremi Unuttum'))
                              ],
                            ),
                            const SizedBox(height: 20,),
                            wrapSignUp(context,networkResult,store)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  AppBar get buildAppBar {
    return AppBar(
        title: const Text(ApplicationConstants.APPNAME),
      );
  }
  SizedBox get buildSizedBox => const SizedBox(height: 8,);
  Text buildTextfieldTitle(BuildContext context,String word) => Text(word,style: context.textTheme?.generalTextStyle,);
  Observer buildTextFieldEmail(LoginPageViewModel store) {
    return Observer(
      builder: (_){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi beyaz
            border: Border.all(color: store.isFocusedNodeEmail ? Colors.blue : Colors.black38,), // Çerçeve rengi siyah
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3), // Neon gibi parlak mavi renk
                blurRadius: 10.0, // Bulanıklık miktarı
                spreadRadius: 1.0, // Yayılma miktarı
                offset: const Offset(0, 0), // Gölgenin yönü
              ),
            ],
          ),
          child: TextFormField(
            controller: store.emailController,
            focusNode: store.focusNodeEmail,
            style: const TextStyle(color: Colors.black87,
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
  Observer buildTextFieldPassword(LoginPageViewModel store) {
    return Observer(
      builder: (_){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi beyaz
            border: Border.all(color: store.isFocusedNodePassword ? Colors.blue : Colors.black38,), // Çerçeve rengi siyah
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3), // Neon gibi parlak mavi renk
                blurRadius: 10.0, // Bulanıklık miktarı
                spreadRadius: 1.0, // Yayılma miktarı
                offset: const Offset(0, 0), // Gölgenin yönü
              ),
            ],
          ),
          child: TextFormField(
            controller: store.passwordController,
            obscureText: true,
            focusNode: store.focusNodePassword,
            style: const TextStyle(color: Colors.black87,
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
  Center wrapSignUp(BuildContext context,NetworkResult networkResult,LoginPageViewModel viewModel) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 12,
        children: [
          Text(
            'Hala bir hesabın yok mu?',style: context.textTheme?.generalTextStyle,
          ),
         ElevatedButton(onPressed: (){
              viewModel.navigation.navigateToPage(path: NavigationConstants.REGISTER);
         }, child: const Text('Kayıt Ol'))
        ],
      ),
    );
  }
}
