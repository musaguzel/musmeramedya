import 'package:flutter/material.dart';
import '../../settings/viewModel/settings_view_model.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({Key? key, required this.settingsPageViewModel}) : super(key: key);

  final SettingsViewModel settingsPageViewModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Musmera Medya'),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: const Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text(
          'Hesabınız Silinecektir Onaylıyor Musunuz ?',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await settingsPageViewModel.deleteAccount();

          },
          child: const Text('Evet',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Hayır',style: TextStyle(color: Colors.black),),
        ),
      ],
    );
  }
}
