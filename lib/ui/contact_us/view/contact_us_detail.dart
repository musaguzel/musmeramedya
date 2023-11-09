import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/extension/string_extension.dart';
import 'package:musmeramedya/ui/contact_us/viewModel/contact_us_view_model.dart';
import 'package:musmeramedya/ui/main/view/main_page.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/network/network_change_manager.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ContactUsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, viewModel,networkResult) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Bize Ulaşın'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
                child: buildForm(context, viewModel,networkResult)

        ),
      ),
    );
  }

  Card buildForm(BuildContext context, ContactUsViewModel viewModel,
      NetworkResult networkResult) {
    return Card(
      margin: context.paddingNormal,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: viewModel.formState,
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildTextField(viewModel, viewModel.nameController,"İsim",
                  Icons.drive_file_rename_outline),
              buildSizedBox(15),
              buildTextField(viewModel, viewModel.emailController, "E-mail" ,Icons.email_outlined),
              buildSizedBox(15),
              buildMessageTextField(viewModel),
              buildSizedBox(30),
              elevatedButtonSendMessage(context, viewModel, viewModel,networkResult)
            ],
          ),
        ),
      ),
    );
  }


  SizedBox buildSizedBox(double height) => SizedBox(
        height: height,
      );

  TextFormField buildTextField(ContactUsViewModel viewModel, TextEditingController controller,String labelText, IconData iconData) {
    return TextFormField(
      controller: controller,
      maxLength: 35,
      validator: (value) => value!.isNotEmpty
          ? null
          : "Bu alan gerekli",
      decoration: InputDecoration(
        labelText: labelText,
        icon: Icon(
          iconData,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  TextFormField buildMessageTextField(ContactUsViewModel viewModel) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 160,
      maxLines: null,
      style: const TextStyle(fontSize: 14),
      controller: viewModel.messageController,
      validator: (value) => value!.isNotEmpty
          ? null
          : "Bu Alan gerekli",
      decoration: const InputDecoration(
        labelText: "Mesajınız",
        icon: Icon(
          Icons.message,
          color: Colors.white,
        ),
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

  Observer elevatedButtonSendMessage(BuildContext context,
      ContactUsViewModel viewModel, ContactUsViewModel contactUsViewModel,NetworkResult networkResult) {
    return Observer(
      builder: (_) {
        return ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.purple),minimumSize: MaterialStateProperty.all(Size(context.width / 1.2, 40))),
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (viewModel.nameController.text.isNotEmpty &&
                viewModel.emailController.text.isNotEmpty &&
                viewModel.messageController.text.isNotEmpty &&
                viewModel.emailController.text.isValidEmails) {

                viewModel.sendMessageToFirebase(
                    userModelGlobal.email);

            }else {
              viewModel.showsnackbar(message: "Lütfen bilgileri eksiksiz doldurun");
            }
          },
          child: const Text(
           "Gönder",
          ),
        );
      },
    );
  }
}
