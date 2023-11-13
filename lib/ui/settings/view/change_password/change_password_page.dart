import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/network/network_change_manager.dart';
import '../../viewModel/settings_view_model.dart';



class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, viewModel,networkResult) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Şifre Değiştir'),),
        body: networkResult == NetworkResult.off ? const Center(child: CircularProgressIndicator(),) : GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: buildForm(context,viewModel,networkResult,
          ),
        ),
      ),
    );
  }

  Form buildForm(BuildContext context,SettingsViewModel viewModel,NetworkResult networkResult) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: viewModel.formState,
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [buildOldPasswordTextField(viewModel),
            buildSizedBox(15),
            buildNewPasswordTextField(viewModel),
            buildSizedBox(30),
            elevatedButtonUpdatePassword(context,viewModel,networkResult)
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(height: height,);

  TextFormField buildOldPasswordTextField(SettingsViewModel viewModel) {
    return TextFormField(
      controller: viewModel.oldPasswordController,
      obscureText: true,
      validator: (value) => value!.isNotEmpty ? null : 'Bu Alan Gerekli',
      decoration:  const InputDecoration(
        labelText: 'Mevcut Şifre',
        icon: Icon(Icons.vpn_key,color: Colors.blue,),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 1.0,
          ),
        ),
      ),
    );
  }
  TextFormField buildNewPasswordTextField(SettingsViewModel viewModel) {
    return TextFormField(
      controller: viewModel.newPasswordController,
      obscureText: true,
      validator: (value) => value!.isNotEmpty ? null : 'Bu Alan Gerekli',
      decoration:  const InputDecoration(
        labelText: 'Yeni Şifre',
        icon: Icon(Icons.vpn_key,color: Colors.blue),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 1.0,
          ),
        ),
      ),
    );
  }
  Observer elevatedButtonUpdatePassword(BuildContext context,SettingsViewModel viewModel,NetworkResult networkResult) {
    return Observer(
      builder: (_){
        return ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.purple),minimumSize: MaterialStateProperty.all(Size(context.width / 1.2, 40))),
          onPressed: () async {
            FocusScope.of(context).unfocus();
            if(viewModel.oldPasswordController.text.isNotEmpty && viewModel.newPasswordController.text.isNotEmpty){
              if(viewModel.firebaseAuth.currentUser != null){
                await viewModel.updatePassword(userModelGlobal.email);
              }
            }else{
              viewModel.showsnackbar(message: 'Lütfen tüm Alanları Doldurun');
            }
          }, child:  const Text(
          'Şifreyi Güncelle',
        ),);
      },
    );
  }
}
