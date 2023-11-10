import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/Animation/Fade_Animation.dart';
import '../../../core/init/constants/app/app_constants.dart';
import '../viewModel/register_page_view_model.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: RegisterPageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          //model.init();
        },
        onPageBuilder: (context, viewModel,networkResult) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            title: const Text(ApplicationConstants.APPNAME),
          ),
          body: SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: buildForm(viewModel, context),
              ),
            ),

        ));
  }

  Card buildForm(RegisterPageViewModel viewModel, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20,right: 20,),
      child: Column(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: viewModel.formState,
            child: Padding(
              padding: context.paddingMedium,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTitle(context),
                  textFieldFullName(context, viewModel),
                  sizedBox2,
                  textFieldEmail(context, viewModel),
                  sizedBox2,
                  textFieldPassword(context, viewModel),
                  sizedBox2,
                  textFieldConfirmPassword(context, viewModel),
                  sizedBox2,
                  elevatedButtonLogin(context,viewModel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  FadeAnimation buildTitle(BuildContext context) => FadeAnimation(delay: 0.2,child: Text("Üye Ol",textAlign: TextAlign.center,style: context.textTheme?.generalTextStyle,));



  FadeAnimation textFieldFullName(
      BuildContext context, RegisterPageViewModel viewModel) {
    return FadeAnimation(
      delay: 0.2,
      child: TextFormField(
        style: const TextStyle(color: Colors.black87),
        controller: viewModel.fullNameController,
        validator: (value) => value!.isNotEmpty ? null : "Bu Alan Gerekli",
        decoration: const InputDecoration(
            labelText: "Tam Adınızı Girin",
            icon: Icon(Icons.drive_file_rename_outline)),
      ),
    );
  }

  FadeAnimation textFieldEmail(
      BuildContext context, RegisterPageViewModel viewModel) {
    return FadeAnimation(
      delay: 0.2,
      child: TextFormField(
        style: const TextStyle(color: Colors.black87),
        controller: viewModel.emailController,
        validator: (value) {
          if (value!.isValidEmails) {
            viewModel.emailValidate = true;
            return null;
          } else {
            viewModel.emailValidate = false;
            return "Bu Alan Gerekli";
          }
        },
        decoration: const InputDecoration(
            labelText: "E-Mail",
            icon: Icon(Icons.email,)),
      ),
    );
  }

  SizedBox get sizedBox2 => const SizedBox(
    height: 14,
  );

  Observer textFieldPassword(
      BuildContext context, RegisterPageViewModel viewModel) {
    return Observer(
      builder: (_) {
        return FadeAnimation(
          delay: 0.2,
          child: TextFormField(
            controller: viewModel.passwordController,
            style: const TextStyle(color: Colors.black87),
            validator: (value) =>
            value!.isNotEmpty ? null : "Bu Alan Gerekli",
            obscureText: viewModel.isLock,
            decoration: InputDecoration(
              labelText: "Şifre",
              icon: const Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: () {
                  viewModel.isLockStateChange();
                },
                padding: EdgeInsets.zero,
                icon: Observer(
                  builder: (_) {
                    return Icon(
                        viewModel.isLock ? Icons.lock : Icons.lock_open);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Observer textFieldConfirmPassword(
      BuildContext context, RegisterPageViewModel viewModel) {
    return Observer(
      builder: (_) {
        return FadeAnimation(
          delay: 0.2,
          child: TextFormField(
            style: const TextStyle(color: Colors.black87),
            controller: viewModel.confirmPasswordController,
            validator: (value) =>
            value!.isNotEmpty ? null : "Bu Alan Gerekli",
            obscureText: viewModel.isLock,
            decoration: InputDecoration(
              labelText: "Şifreyi Onayla",
              icon: const Icon(Icons.vpn_key),
            ),
          ),
        );
      },
    );
  }


  FadeAnimation elevatedButtonLogin(BuildContext context,RegisterPageViewModel viewModel) {
    return FadeAnimation(
      delay: 0.2,
      child: ElevatedButton(
        child: const Center(
          child: Text(
            "Üye Ol",
          ),
        ),
        onPressed: () {
          FocusScope.of(context).unfocus();
          if(viewModel.fullNameController.text.isNotEmpty
              && viewModel.emailValidate
              && viewModel.passwordController.text.isNotEmpty
              && viewModel.confirmPasswordController.text.isNotEmpty)
          {
            if(viewModel.passwordController.text == viewModel.confirmPasswordController.text){
              viewModel.createUserWithEmailAndPassword(context);
            }else{
              viewModel.showsnackbar(message: "Şifreler Uyuşmuyor");
            }
          }else{
            viewModel.showsnackbar(message: "Lütfen Tüm Alanları Doldurun");
          }
        },
      ),
    );
  }

  SizedBox sizedBox3(BuildContext context) {
    return SizedBox(
      height: context.height * 0.07,
    );
  }
}
