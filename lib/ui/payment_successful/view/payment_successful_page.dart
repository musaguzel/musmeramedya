import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:musmeramedya/core/init/constants/navigation/navigation_constants.dart';

import '../../../core/init/navigation/navigation_service.dart';



class PaymentSuccessfulPage extends StatelessWidget {
   PaymentSuccessfulPage({super.key});

  final NavigationService navigation = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ödeme Tamamlandı'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset(
              'assets/animations/done.json', // Lottie animasyonunun yerel dosya yolu
              height: context.height / 3, // İsteğe bağlı: animasyonun yüksekliği
              width: 100, // İsteğe bağlı: animasyonun genişliği
              repeat: false,
            ),
            ListTile(
             title: Text('Ödemeniz İnceleniyor',textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),
              subtitle: Text('\nÖdemenizi doğruladıktan sonra bakiyeniz ortalama 1-2 saat içinde hesabınıza yansır',textAlign: TextAlign.center,),
            ),
            Spacer(),
          ElevatedButton(
            onPressed: () {
              navigation.navigateToPageClear(path: NavigationConstants.ADD_BALANCE);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ödemenizin Durumunu İzlemek İçin Tıklayın  '),
                Icon(
                  Icons.arrow_circle_right_outlined,
                )
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
