import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/components/Animation/Fade_Animation.dart';
import '../../../core/init/network/network_change_manager.dart';
import '../viewModel/forgot_password_page_view_model.dart';


class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: ForgotPasswordPageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
        },
        onDispose: () {
          emailController.dispose();
        },
        onPageBuilder: (context, viewModel, networkResult) => Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: buildAppBar,
              body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: context.paddingMediumVertical,
                      child: FadeAnimation(
                        delay: 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildPageText,
                            buildEmailField(context, viewModel),
                            buildResetPasswordButton(context, viewModel, networkResult)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

            ));
  }

  AppBar get buildAppBar {
    return AppBar(
              title: const Text('Şifremi Unuttum'),
            );
  }

  Text get buildPageText => const Text('Şifrenizi sıfırlamak için bir e-posta alın');

  Observer buildEmailField(BuildContext context, ForgotPasswordPageViewModel viewModel) {
    return Observer(builder: (_) {
      return Padding(
        padding: context.paddingMedium,
        child: TextFormField(
            key: formKey,
            controller: emailController,
            cursorColor: Colors.pink.shade200,
            textInputAction: TextInputAction.done,
            decoration:
            const InputDecoration(labelText: "Email"),
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            validator: (email) {
              if (email != null && !email.isValidEmails) {
                viewModel.emailIsValidate = false;
                return 'Geçersiz E-mail adresi';
              }
              viewModel.emailIsValidate = true;
              return null;
            }),
      );
    });
  }

  Observer buildResetPasswordButton(BuildContext context, ForgotPasswordPageViewModel viewModel, NetworkResult networkResult) {
    return Observer(builder: (_) {
      return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(context.width * 0.90,
                  context.height * 0.06),
              backgroundColor: Colors.pink.withOpacity(
                  viewModel.emailIsValidate ? 1 : 0.5)),
          onPressed: () {
            if(networkResult == NetworkResult.on){
              if (viewModel.emailIsValidate && emailController.text.isNotEmpty) {
                viewModel.sendVeryfyEmail(emailController);
              }
            }
          },
          icon: const Icon(
            Icons.email,
            color: Colors.white,
          ),
          label: const Text(
            'Şifreyi Sıfırla',
            style: TextStyle(color: Colors.white),
          ));
    });
  }

}
