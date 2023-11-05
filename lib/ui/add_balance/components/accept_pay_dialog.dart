import 'package:flutter/material.dart';


class AcceptPayDialog extends StatelessWidget {
  const AcceptPayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ödemeyi Onayla'),
      content: Text('Ödemeyi Yaptıysanız Evet seçeneğini seçin'),
      actions: [
        TextButton(onPressed:() => Navigator.of(context).pop(), child: Text('Evet')),
        TextButton(onPressed:() => Navigator.of(context).pop(), child: Text('Hayır')),
      ],
    );
  }
}
