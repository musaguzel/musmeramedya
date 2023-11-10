import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musmeramedya/core/init/theme/app_theme.dart';
import 'core/init/constants/app/app_constants.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await _init();
  runApp(const MyApp());
}


Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.APPNAME,
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}



//indirim olmayacak 100 ' e 120 verilecek
//satın alımlarda bakiye güncellemeleri yapılacak
//referans sistemine devam edilecek
//ekranda sipariş yoksa falan henüz bir siparişiniz yok diye ekranın ortasında yazsın
//yazı yazılırken klavye açıldığında ekranda herhangi bir yere basıldığında klavye kapansın
//internet kontrolü eklenecek
//url , kısmına regex kural tanımlanacak
//kodlar düzenlenecek stringler ayarlanacak, tasarım güzelleştirilecek
